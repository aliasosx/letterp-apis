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
                    const full_food_name = orderdetail_json.food.food_name;

                    const orderdetailNew = Orderdetail.create({
                        orderId, foodId, full_food_name, quantity, price, total, note
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
        const kitchenorders = await sequelize.query("select t.tick_number,o.id,fd.food_name,od.full_food_name,od.quantity,od.price, od.note, st.status, st.location, o.order_datetime  from food fd , foodtypes ft , orders o , orderdetails od , statuses st , tickets t where fd.foodtypeId = ft.id and fd.id = od.foodId and o.id = od.orderId and o.statusId = st.id and t.id = o.ticketId and st.status like '%kitchen' order by o.order_datetime asc", { type: sequelize.QueryTypes.SELECT })
            .then((kitchenorders) => {
                res.send(kitchenorders);
                next();
            }).catch((err) => {
                return next(new errors.InvalidContentError(err.message));
            });
    });
    server.get('/kitchenordersByKid/:id', async (req, res, next) => {
        let sql;
        if (req.params.id == 0) {
            sql = "select t.tick_number,o.id,fd.food_name,od.full_food_name,od.quantity,od.price, od.note, st.status, st.location, o.order_datetime,od.done  from food fd , foodtypes ft , orders o , orderdetails od , statuses st , tickets t where fd.foodtypeId = ft.id and fd.id = od.foodId and o.id = od.orderId and o.statusId = st.id and t.id = o.ticketId and st.status like '%kitchen' order by o.order_datetime asc";
        } else {
            sql = "select t.tick_number,o.id,fd.food_name,od.full_food_name,od.quantity,od.price, od.note, st.status, st.location, o.order_datetime,od.done  from food fd , foodtypes ft , orders o , orderdetails od , statuses st , tickets t where fd.foodtypeId = ft.id and fd.id = od.foodId and o.id = od.orderId and o.statusId = st.id and t.id = o.ticketId and st.status like '%kitchen' and fd.kitchenId = " + req.params.id + " order by o.order_datetime asc";
        }
        const kitchenorders = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT })
            .then((kitchenorders) => {
                res.send(kitchenorders);
                next();
            }).catch((err) => {
                return next(new errors.InvalidContentError(err.message));
            });
    });
    server.get('/kitchenorders/:id', async (req, res, next) => {
        const kitchenorders = await sequelize.query("select t.id as ticketId , t.tick_number,o.id,od.id detailId,fd.food_name,od.full_food_name,od.quantity,od.price, od.note, st.status, st.location, o.order_datetime,case od.done when 0 then 'false' when 1 then 'true'  end as done  from food fd , foodtypes ft , orders o , orderdetails od , statuses st , tickets t where fd.foodtypeId = ft.id and fd.id = od.foodId and o.id = od.orderId and o.statusId = st.id and t.id = o.ticketId and st.status like 'pending%' and t.id= " + req.params.id + " order by o.order_datetime asc", { type: sequelize.QueryTypes.SELECT })
            .then((kitchenorders) => {
                res.send(kitchenorders);
                next();
            }).catch((err) => {
                return next(new errors.InvalidContentError(err.message));
            });
    });
    server.get('/ordertrackings', async (req, res, next) => {
        const ordertrackings = await sequelize.query("select o.id, t.id as ticketId ,t.tick_number,s.status,s.location, o.order_datetime,(now() - order_datetime) time_passed, o.grandtotal from orders o , tickets t , statuses s, users u where o.ticketId = t.id and o.statusId = s.id and s.status like'pending%' and u.id = o.userId order by o.order_datetime asc", { type: sequelize.QueryTypes.SELECT })
            .then((ordertrackings) => {
                res.send(ordertrackings);
                next();
            }).catch((err) => {
                return next(new errors.InvalidContentError(err.message));
            });
    });
    server.get('/orderByday', async (req, res, next) => {
        const ordertrackingByDay = await sequelize.query("select o.id, t.id as ticketId ,t.tick_number,s.status,s.location, o.order_datetime,(now() - order_datetime) time_passed, o.grandtotal,u.username from orders o , tickets t , statuses s, users u where o.ticketId = t.id and o.statusId = s.id and u.id = o.userId and date(o.order_datetime)=date(now()) order by o.order_datetime asc", { type: sequelize.QueryTypes.SELECT }).then(resp => {
            res.send(resp);
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

    server.put('/reverseOrder/:id', async (req, res, next) => {
        try {
            const ReverseOrderById = await Order.update(req.body, {
                where: {
                    id: req.params.id,
                    settled: false
                }
            }).then(() => {
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                res.send({ status: 'fail', reason: err.message });
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        };
    });

    server.post('/maketransactionfinish', async (req, res, next) => {
        const { orderdetailId, value } = req.body;
        console.log(req.body);

        try {
            const c = await Orderdetail.update({
                'done': value
            }, {
                    where: {
                        id: orderdetailId
                    }
                }).then(resp => {
                    console.log(resp);
                    res.send({ status: 'success' });
                    next();
                });

        } catch (err) {
            console.log(err);
            return next(new errors.InternalError(err.message));
        }
    });
    server.get('/notesuggests', async (req, res, next) => {
        try {
            const s = await sequelize.query('select distinct(note) notes,count(*) from orderdetails where note is not null group by note order by count(*) desc', { type: sequelize.QueryTypes.SELECT }).then((resp) => {
                res.send(resp);
                next();
            }).catch((err) => {
                res.send({ status: 'fail', reason: err.message });
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
}