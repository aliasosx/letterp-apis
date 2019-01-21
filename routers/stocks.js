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
const Stock = require('../models/stock');
const Stocktracking = require('../models/Stocktracking');

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

    // add new product
    server.post('/products', async (req, res, next) => {
        try {
            let c = await Product.create(req.body).then(async (resp) => {
                // add stock
                let m = await Stock.create({
                    'productId': resp.dataValues.id,
                    'stockDate': resp.dataValues.createdAt,
                    'quantity': resp.dataValues.initQuantity,
                    'currentQuantity': resp.dataValues.currentQuantity,
                    'expiryDate': resp.dataValues.expiryDate,
                    'descriptions': 'new product added',
                    'userId': resp.dataValues.userId
                }).then(async (resps) => {
                    // add new stocktracking
                    let n = await Stocktracking.create({
                        'stockId': resps.dataValues.id,
                        'beforeQuantity': resps.dataValues.quantity,
                        'used': 0,
                        'userId': resps.dataValues.userId
                    }).then(respst => {
                        res.send({ status: 'success' });
                        next();
                    }).catch((err) => {
                        console.log(err);
                        Product.destroy({
                            where: {
                                id: resp.dataValues.id
                            }
                        });
                        Stock.destroy({
                            where: {
                                id: resps.dataValues.id
                            }
                        })
                    });

                }).catch((err) => {

                    Product.destroy({
                        where: {
                            id: resp.dataValues.id
                        }
                    });
                    console.log(err);
                });
            }).catch((err) => {
                console.log(err);
                res.send({ status: 'fail', resason: err });
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err));
        }
    });
    // End add new stock

    server.get('/stocks/:prodId', async (req, res, next) => {
        try {
            const c = await Stock.findAll({
                where: {
                    enabled: true,
                    productId: req.params.prodId
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


    // Update Stock information 
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

