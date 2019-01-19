const errors = require('restify-errors');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequelize = require('../db/connectionInitializer');
const Producttype = require('../models/Producttype');

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
    server.get('/products', async (req, res, next) => {
        try {
            const c = await sequelize.query("select p.id , p.productCode,fd.food_name, p.productName, pt.id producttypeId,pt.productTypeCode, p.minimumStock,st.quantity,st.currentQuantity, u.id as unitId, u.unitName , u.unitSign, fd.cost, fd.price, v.id vendorId , v.shopName,st.stockDate,st.expiryDate,us.username,us.id userId  from food fd, products p, producttypes pt, vendors v , stocks st, units u , users us where fd.id = p.foodId and p.productTypeId = pt.id and p.vendorId = v.id and p.id = st.productId and u.id = p.unitId and us.id = p.userId", { type: sequelize.QueryTypes.SELECT }).then((resp) => {
                res.send(resp);
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
}

