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
                            tick_number: ticketId
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
}