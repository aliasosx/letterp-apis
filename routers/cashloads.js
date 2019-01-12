const errors = require('restify-errors');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequelize = require('../db/connectionInitializer');
const df = require('dateformat');
const Cashload = require('../models/Cashload');
const Order = require('../models/Order');

module.exports = server => {
    server.post('/getcashloadsByUser', async (req, res, next) => {
        const { userId } = req.body;
        try {
            const cashstatus = await Cashload.findAll({
                where: {
                    userId: userId,
                    loaded: true,
                    closed: false
                }
            });
            res.send(cashstatus);
            next();
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
    server.post('/cashloads', async (req, res, next) => {
        try {
            const {
                startamount,
                userId,
                loadcheckerId,
                loaded
            } = req.body;
            const loaddatetime = Date.now();
            const c = await Cashload.create({
                startamount,
                userId,
                loaddatetime,
                loadcheckerId,
                loaded,
            }).then(resp => {
                res.send({ status: 'success' });
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
    server.get('/settle/:id', async (req, res, next) => {
        const currentDate = df(new Date, "yyyy-mm-dd");
        console.log(currentDate)

        try {
            const o = await sequelize.query('update orders set settled=true where userId=' + req.params.id + ' and date(order_datetime) = date(now()) and settled=false',
                { type: sequelize.QueryTypes.UPDATE }).then(async () => {
                    const c = await Cashload.update({
                        closed: true,
                        closedatetime: new Date()
                    }, {
                            where: {
                                userId: req.params.id,
                                closed: false
                            }
                        }).then(async () => {
                            const summary = await sequelize.query('select count(*) count, sum(od.price) total from orders o , orderdetails od where o.id = od.orderId and o.userId=' + req.params.id + ' and date(o.order_datetime) = date(now()) and o.settled=true',
                                { type: sequelize.QueryTypes.SELECT }).then((resp) => {
                                    console.log(resp);
                                    res.send(resp);
                                    next();
                                }).catch((err) => {
                                    console.log(err);
                                });

                        }).catch((err) => {
                            console.log(err);
                        });
                }).catch((err) => {
                    console.log(err);
                });

        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
}