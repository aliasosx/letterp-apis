const errors = require('restify-errors');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequelize = require('../db/connectionInitializer');
// Load models
const Order = require('../models/Order');
const Orderdetail = require('../models/Orderdetail');
const Ticket = require('../models/Ticket');
const Status = require('../models/Status');
const Customer = require('../models/Customer');

module.exports = server => {
    server.post('/makeorders', async (req, res, next) => {
        console.log(req.body);
        const { quantity, grandtotal, ticketId, statusId, userId, orderdetail, customerId, received, change } = req.body;
        // add Order 

        try {
            const o = await Order.create({
                quantity, grandtotal, ticketId, statusId, userId, customerId, received, change
            }).then((order) => {
                //console.log(JSON.parse(orderdetail));
                console.log('-------------------- Order posted --------------------');
                orderdetail.forEach(orderdetail => {
                    json_order = JSON.parse(orderdetail);
                    console.log(json_order);
                });

                // add order detail

                orderdetail.forEach(orderdetail => {
                    let orderdetail_json = JSON.parse(orderdetail);
                    console.log(orderdetail_json);
                    const orderId = order.id;
                    const foodId = orderdetail_json.food.id;
                    const quantity = orderdetail_json.quantity;
                    const price = orderdetail_json.food.price;
                    const total = orderdetail_json.quantity * orderdetail_json.food.price;
                    const note = orderdetail_json.note;

                    const orderdetailNew = Orderdetail.create({
                        orderId, foodId, quantity, price, total, note
                    }).then(() => {
                        // update ticket
                        console.log('-------------------- Transaction posted --------------------');
                        // Order detail
                    }).catch((err) => {
                        console.log(err.message);
                        /*
                        res.send({ status: 'failed', because: err.message });
                        next();
                        */
                    });
                });

                // Update ticket
                const tk = Ticket.update({
                    ticket_available: false
                }, {
                        where: {
                            id: ticketId
                        }
                    }).then(() => {
                        console.log('-------------------- Ticket posted --------------------');
                        res.send({ status: 'success' });
                        next();
                    }).catch((err) => {
                        res.send({ status: 'failed', because: err.message });
                        next();
                    });

                // Order
            }).catch((err) => {
                res.send({ status: 'failed', because: err.message });
                next();
            });
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });
    server.get('/kitchenorders', async (req, res, next) => {
        const kitchenorders = await sequelize.query("select t.tick_number,o.id,fd.food_name,od.quantity,od.price, od.note, st.status, st.location, o.order_datetime  from food fd , foodtypes ft , orders o , orderdetails od , statuses st , tickets t where fd.foodtypeId = ft.id and fd.id = od.foodId and o.id = od.orderId and o.statusId = st.id and t.id = o.ticketId and st.status = 'pending' order by o.order_datetime asc", { type: sequelize.QueryTypes.SELECT })
            .then((kitchenorders) => {
                res.send(kitchenorders);
                next();
            }).catch((err) => {
                return next(new errors.InvalidContentError(err.message));
            });
    });
    server.get('/ordertrackings', async (req, res, next) => {
        const ordertrackings = await sequelize.query("select o.id, t.tick_number,s.status,s.location, o.order_datetime,(now() - order_datetime) time_passed, o.grandtotal from orders o , tickets t , statuses s, users u where o.ticketId = t.id and o.statusId = s.id and s.status='pending' and u.id = o.userId order by o.order_datetime asc", { type: sequelize.QueryTypes.SELECT })
            .then((ordertrackings) => {
                res.send(ordertrackings);
                next();
            }).catch((err) => {
                return next(new errors.InvalidContentError(err.message));
            });
    });
    server.put('/orders/:id', async (req, res, next) => {
        try {
            const { statusId, finish_datetime, ticketId } = req.body;
            const o = await Order.update({
                statusId, finish_datetime
            }, {
                    where: {
                        id: req.params.id
                    }
                }).then(async () => {
                    const ticket = await Ticket.update({
                        ticket_available: true
                    }, {
                            where: {
                                id: ticketId
                            }
                        }).then(() => {
                            res.send({ status: 'success' });
                            next();
                        }).catch((err) => {
                            res.send({ status: 'failed', reason: err.message });
                            next();
                        });
                }).catch((err) => {
                    res.send({ status: 'failed', reason: err.message });
                    next();
                });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
}