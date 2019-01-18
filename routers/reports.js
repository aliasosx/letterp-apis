const errors = require('restify-errors');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequelize = require('../db/connectionInitializer');

module.exports = server => {
    // user reports
    server.post('/reportbykitchens', async (req, res, next) => {
        try {
            let sql = "select kitchen_name, sum(ot.quantity) count ,sum(fd.cost*ot.quantity) cost,sum(total) total from orderdetails ot , food fd , orders o , kitchens ks  where o.id = ot.orderId and fd.id = ot.foodId and o.statusId = 2 and ks.id = fd.kitchenId and date(o.order_datetime) = date('" + req.body.dt + "') and fd.kitchenId='" + req.body.kitchen + "' group by  kitchen_name order by count desc";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
    server.post('/reportbyfoodType', async (req, res, next) => {
        try {
            let sql = "select ft.food_type_desc,ft.food_type_desc_la, sum(od.quantity) count, sum(fd.cost*od.quantity) cost, sum(fd.price*od.quantity) total,date(o.order_datetime) 'Date' from foodtypes ft , food fd , orders o , orderdetails od where o.id = od.orderId and od.foodId = fd.id and fd.foodtypeId  = ft.id and date(o.order_datetime) = date('" + req.body.dt + "') and fd.kitchenId='" + req.body.kitchen + "'  and o.statusId=2 group by fd.foodtypeId order by count desc";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
    server.post('/reporttopfood', async (req, res, next) => {
        try {
            let sql = "select ot.full_food_name food_name, sum(ot.quantity) as count,sum(fd.cost * ot.quantity) cost, sum(fd.price*ot.quantity) total from food fd , orders o , orderdetails ot where fd.id = ot.foodId and ot.orderId = o.id and o.statusId = 2 and date(o.order_datetime) = date('" + req.body.dt + "') and fd.kitchenId='" + req.body.kitchen + "' group by fd.id order by count desc ";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
    // admin reports
    server.post('/adminreportbykitchens', async (req, res, next) => {
        try {
            let sql = "select kitchen_name, sum(ot.quantity) count ,sum(cost*ot.quantity) cost,sum(total) total , o.grandtotal as grandtotal from orderdetails ot , food fd , orders o , kitchens ks  where o.id = ot.orderId and fd.id = ot.foodId and o.statusId = 2 and ks.id = fd.kitchenId and date(o.order_datetime) between date('" + req.body.dt + "') and date('" + req.body.edt + "') group by  kitchen_name order by count desc";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
    server.post('/adminreportbyfoodType', async (req, res, next) => {
        try {
            let sql = "select ft.food_type_desc,ft.food_type_desc_la, sum(od.quantity) count, sum(fd.cost*od.quantity) cost, sum(fd.price*od.quantity) total ,date(o.order_datetime) 'Date' from foodtypes ft , food fd , orders o , orderdetails od where o.id = od.orderId and od.foodId = fd.id and fd.foodtypeId  = ft.id and date(o.order_datetime) between date('" + req.body.dt + "') and date('" + req.body.edt + "')   and o.statusId=2 group by fd.foodtypeId order by count desc";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
    server.post('/adminreporttopfood', async (req, res, next) => {
        try {
            let sql = "select ot.full_food_name food_name, sum(ot.quantity) as count,sum(fd.cost * ot.quantity) cost, sum(fd.price*ot.quantity) total from food fd , orders o , orderdetails ot where fd.id = ot.foodId and ot.orderId = o.id and o.statusId = 2 and date(o.order_datetime) between date('" + req.body.dt + "') and date('" + req.body.edt + "')  group by  fd.id order by  count desc ";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();

            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
    server.post('/adminreportbyuser', async (req, res, next) => {
        try {
            let sql = "select u.username, sum(ot.quantity) count,sum(ot.total) as total from orders o, users u , orderdetails ot where o.userId = u.id and o.id = ot.orderId and date(o.order_datetime) between date('" + req.body.dt + "') and date('" + req.body.edt + "') and o.statusId=2 group by u.id  order by  count(*) desc ";
            const r = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(r => {
                res.send(r);
                next();
            })
        } catch (err) {
            res.send(new errors.InternalError(err.message));
        }
    });
    // Chart
    server.post('/sale_volume', async (req, res, next) => {
        try {
            const s = await sequelize.query("select ft.food_type_desc,ft.food_type_desc_la,sum(ot.quantity) qty, sum(fd.price * ot.quantity) as Total from orderdetails ot , food fd , foodtypes ft, orders o where fd.id = ot.foodId and fd.foodtypeId = ft.id and ot.orderId = o.id and date(o.order_datetime) between date('" + req.body.dt + "') and date('" + req.body.edt + "') and o.statusId = 2 and fd.kitchenId=2 group by ft.food_type_desc", { type: sequelize.QueryTypes.SELECT }).then(resp => {
                res.send(resp);
                next();
            }).catch((err) => {
                res.send(err.message);
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
    server.post('/sale_by_food', async (req, res, next) => {
        let sql = "select fd.food_name,sum(ot.quantity) qty, sum(fd.price * ot.quantity) as Total from orderdetails ot , food fd , foodtypes ft, orders o where fd.id = ot.foodId and fd.foodtypeId = ft.id and ot.orderId = o.id and o.statusId = 2 and date(o.order_datetime) between date('" + req.body.dt + "') and date('" + req.body.edt + "') and fd.kitchenId=2  group by fd.food_name";
        try {
            const s = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(resp => {
                res.send(resp);
                next();
            }).catch((err) => {
                res.send(err.message);
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
    server.post('/sale_by_users', async (req, res, next) => {
        let sql = "select u.username,sum(ot.quantity) qty, sum(fd.price * ot.quantity) as Total from users u ,orderdetails ot , food fd , foodtypes ft, orders o where o.userId = u.id and fd.id = ot.foodId and fd.foodtypeId = ft.id and ot.orderId = o.id and o.statusId = 2 and date(o.order_datetime) between date('" + req.body.dt + "') and date('" + req.body.edt + "') and fd.kitchenId=2  group by u.username";
        try {
            const s = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(resp => {
                res.send(resp);
                next();
            }).catch((err) => {
                res.send(err.message);
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
    server.post('/sale_by_day', async (req, res, next) => {
        let sql = "select date(o.order_datetime) order_date,sum(ot.quantity) qty, sum(fd.price * ot.quantity) as Total from users u ,orderdetails ot , food fd , foodtypes ft, orders o where o.userId = u.id and fd.id = ot.foodId and fd.foodtypeId = ft.id and ot.orderId = o.id and o.statusId = 2 and date(o.order_datetime) between date('" + req.body.dt + "') and date('" + req.body.edt + "') and fd.kitchenId=2  group by order_date order by order_date asc";
        try {
            const s = await sequelize.query(sql, { type: sequelize.QueryTypes.SELECT }).then(resp => {
                res.send(resp);
                next();
            }).catch((err) => {
                res.send(err.message);
                next();
            });
        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
}