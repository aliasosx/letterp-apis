const errors = require('restify-errors');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequelize = require('../db/connectionInitializer');

module.exports = server => {
    server.get('/reportbykitchens/:id', async (req, res, next) => {
        try {
            let sql = "select kitchen_name, count(*) ,sum(cost),sum(total) from orderdetails ot , food fd , orders o , kitchens ks  where o.id = ot.orderId and fd.id = ot.foodId and o.statusId = 2 and ks.id = fd.kitchenId and date(o.order_datetime) = date('" + req.params.id + "') group by  kitchen_name by count(*) desc";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
    server.get('/reportbyfoodType/:id', async (req, res, next) => {
        try {
            let sql = "select ft.food_type_desc,ft.food_type_desc_la, count(*) count, sum(fd.cost) cost, sum(fd.price) total ,date(o.order_datetime) 'Date' from foodtypes ft , food fd , orders o , orderdetails od where o.id = od.orderId and od.foodId = fd.id and fd.foodtypeId  = ft.id and date(o.order_datetime) = date('" + req.params.id + "')  and o.statusId=2 group by fd.foodtypeId order by count(*) desc";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
    server.get('/reporttopfood/:id', async (req, res, next) => {
        try {
            let sql = "select fd.food_name, count(*) as count,sum(fd.cost) cost, sum(fd.price) total from food fd , orders o , orderdetails ot where fd.id = ot.foodId and ot.orderId = o.id and o.statusId = 2 and date(o.order_datetime) = date('" + req.params.id + "') group by  fd.id order by  count(*) desc ";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
}