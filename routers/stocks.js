const errors = require('restify-errors');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequelize = require('../db/connectionInitializer');
const Producttype = require('../models/Producttype');
const Vendor = require('../models/vendor');
const Product = require('../models/product');
const Unit = require('../models/unit');

module.exports = server => {
    server.get('/producttypes', async (req, res, next) => {
        try {
            const c = await Producttype.findAll({
                where: {
                    enabled: true
                }
            }).then(resp => {
                res.send(resp);
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });

    server.get('/vendors', async (req, res, next) => {
        try {
            const c = await Vendor.findAll({
                where: {
                    enabled: true
                }
            }).then(resp => {
                console.log(resp);
                res.send(resp);
                next();
            }).catch((err) => {
                console.log(err);
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });

    server.get('/products', async (req, res, next) => {
        try {
            const c = await sequelize.query("select p.id, p.productCode,p.productName,pt.productTypeCode,p.minimumStock,p.currentQuantity,p.initQuantity,u.unitName, p.cost,v.shopName,p.updatedAt,p.expiryDate,us.username from products p , producttypes pt , vendors v , units u , users us  where p.productTypeId = pt.id and p.vendorId = v.id and p.unitId = u.id and p.userId = us.id", { type: sequelize.QueryTypes.SELECT }).then((resp) => {
                res.send(resp);
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });

    server.get('/products/:id', async (req, res, next) => {
        try {
            const c = await sequelize.query("select * from products where id=" + req.params.id, { type: sequelize.QueryTypes.SELECT }).then((resp) => {
                res.send(resp);
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });

    server.get('/units', async (req, res, next) => {
        try {
            const c = await Unit.findAll({
                where: {
                    enabled: true
                }
            }).then(resp => {
                console.log(resp);
                res.send(resp);
                next();
            }).catch((err) => {
                console.log(err);
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
    server.post('/products', async (req, res, next) => {

        try {
            let c = await Product.create(req.body).then(resp => {
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                res.send({ status: 'fail', resason: err });
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err));
        }
    });
    server.put('/products/:id', async (req, res, next) => {
        try {
            let c = await Product.update(req.body, {
                where: {
                    id: req.params.id
                }
            }).then(resp => {
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                console.log(err);
                res.send({ status: 'fail', resason: err });
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err));
        }
    });
}

