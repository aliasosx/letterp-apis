const errors = require('restify-errors');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequelize = require('../db/connectionInitializer');

module.exports = server => {
    server.get('/reportbykitchens', async (req, res, next) => {
        try {
            let sql = "select kitchen_name, count(fd.food_name) as count,sum(fd.price) total ,date(o.order_datetime) 'Date'  from kitchens ks , food fd , orderdetails ot , orders o where fd.kitchenId = ks.id and ot.foodId = fd.id and o.id = ot.orderId and o.statusId = 2 and date(o.order_datetime) = date(now()) group by ks.id order by count(*) desc";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
    server.get('/reportbyfoodType', async (req, res, next) => {
        try {
            let sql = "select ft.food_type_desc,ft.food_type_desc_la, count(*) count, sum(fd.price) total ,date(o.order_datetime) 'Date' from foodtypes ft , food fd , orders o , orderdetails od where o.id = od.orderId and od.foodId = fd.id and fd.foodtypeId  = ft.id and date(o.order_datetime) = date(now())  and o.statusId=2 group by fd.foodtypeId order by count(*) desc";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
}