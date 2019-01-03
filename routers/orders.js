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
        const { quantity, total, ticketId, statusId, userId, orderdetail, customerId } = req.body;
        // add Order 

        try {
            const o = await Order.create({
                quantity, total, ticketId, statusId, userId, customerId
            }).then((order) => {
                console.log(order.id);
                // add order detail

                orderdetail.forEach(orderdetail => {
                    const orderId = order.id;
                    const foodId = orderdetail.foodId;
                    const quantity = orderdetail.quantity;
                    const price = orderdetail.price;
                    const total = orderdetail.total;
                    const note = orderdetail.note;

                    const orderdetailNew = Orderdetail.create({
                        orderId, foodId, quantity, price, total, note
                    }).then(() => {
                        // update ticket
                        const tk = Ticket.update({
                            ticket_available: false
                        }, {
                                where: {
                                    tick_number: ticketId
                                }
                            }).then(() => {
                                res.send({ status: 'success' });
                                next();
                            }).catch((err) => {
                                res.send({ status: 'failed', because: err.message });
                                next();
                            });
                    }).catch((err) => {
                        res.send({ status: 'failed', because: err.message });
                        next();
                    });
                });

            }).catch((err) => {
                res.send({ status: 'failed', because: err.message });
                next();
            });
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }

    });
}