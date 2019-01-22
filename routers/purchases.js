const errors = require('restify-errors');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequelize = require('../db/connectionInitializer');
const Purchase = require('../models/Purchase');

module.exports = server => {
    server.get('/purchases', async (req, res, next) => {
        const c = await Purchase.findAll().then(resp => {
            res.send(resp);
            next();
        }).catch((err) => {
            console.log(err);
            res.send(err);
            next();
        });
    });
    server.post('/purchases', async (req, res, next) => {
        try {
            let c = await Purchase.create(req.body).then(() => {
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                res.send({ status: err });
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err));
        }
    });
    server.del('/purchases/:id', async (req, res, next) => {
        try {
            let c = await Purchase.destroy({
                where: {
                    id: req.params.id
                }

            }).then(() => {
                res.send({ status: 'success' });
                next()
            }).catch((err) => {
                res.send({ status: err });
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err));
        }
    });
    server.put('/purchases/:id', async (req, res, next) => {
        try {
            let c = await Purchase.update(req.body, {
                where: {
                    id: req.params.id
                }

            }).then(() => {
                res.send({ status: 'success' });
                next()
            }).catch((err) => {
                res.send({ status: err });
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err));
        }
    });
    server.get('/purchaseshow', async (req, res, next) => {
        try {
            let c = await sequelize.query('select ps.id, ps.refno,p.productName,ps.quantity, ps.purchaseDate, ps.invoiceNo, v.shopName, u.username,ps.price, ps.total from purchases ps , products p , users u , vendors v where ps.productId = p.id and ps.userId = u.id and ps.vendorId = v.id', { type: sequelize.QueryTypes.SELECT }).then((resp) => {
                res.send(resp);
                next();
            }).catch((err) => {
                console.log(err);
                res.send({ status: 'fail' });
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err));
        }
    });
}