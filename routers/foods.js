const errors = require('restify-errors');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequelize = require('../db/connectionInitializer');

const Food = require('../models/Food');
const Foodtypes = require('../models/Foodtype');
const Kitchen = require('../models/Kitchen');

module.exports = server => {
    // Food api
    server.get('/foods', async (req, res, next) => {
        try {
            const foods = await Food.findAll();
            res.send(foods);
            next();
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });
    server.get('/fooddetail', async (req, res, next) => {
        try {
            sequelize.query('select fd.id, fd.photo, fd.food_name,fd.cost, fd.price, fd.enabled,fd.currcode,u.username, ft.food_type_desc, kt.kitchen_code ,kt.kitchen_name, fd.enabled_child_food from food fd , foodtypes ft , kitchens kt, users u where fd.kitchenId = kt.id and fd.foodtypeId = ft.id and fd.userId = u.id', { type: sequelize.QueryTypes.SELECT })
                .then((foods) => {
                    res.send(foods);
                    next();
                }).catch((err) => {
                    res.send({ message: 'No records' });
                    next();
                });
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });
    server.get('/foodsbytype/:id', async (req, res, next) => {
        try {
            sequelize.query('select fd.id, fd.photo, fd.food_name,fd.cost, fd.price, fd.enabled,fd.currcode,u.username, ft.food_type_desc, kt.kitchen_code ,kt.kitchen_name, fd.enabled_child_food from food fd , foodtypes ft , kitchens kt, users u where fd.kitchenId = kt.id and fd.foodtypeId = ft.id and fd.userId = u.id and ft.id = ?', { replacements: [req.params.id], type: sequelize.QueryTypes.SELECT })
                .then((foods) => {
                    res.send(foods);
                    next();
                }).catch((err) => {
                    res.send({ message: 'No records' });
                    next();
                });
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });

    server.put('/foods/:id', async (req, res, next) => {
        console.log(req.body);
        try {
            const food = await Food.update(req.body, {
                where: {
                    id: req.params.id
                }
            }).then(() => {
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next();
            });
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });

    server.get('/foods/:id', async (req, res, next) => {
        try {
            const food = await Food.findById(req.params.id);
            res.send(food);
            next();
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });
    server.post('/foods', async (req, res, next) => {
        console.log(req.body);
        try {
            const {
                food_name,
                parents_food_id,
                photo,
                foodtypeId,
                cost,
                price,
                currcode,
                enabled,
                created_by,
                userId,
                kitchenId,
                enabled_child_food,

            } = req.body;
            const addNewFood = await Food.create({
                food_name,
                parents_food_id,
                photo,
                foodtypeId,
                cost,
                price,
                currcode,
                enabled,
                created_by,
                userId,
                kitchenId,
                enabled_child_food,
            }).then(() => {
                res.send({ status: 'success' });
                next()

            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next()
            });
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });

    server.del('/foods/:id', async (req, res, next) => {
        try {
            const removeFood = Food.destroy({
                where: {
                    id: req.params.id
                }
            }).then(() => {
                res.send({ status: 'success' });
                next()
            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next()
            });
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        };
    });

    // Food Type api
    server.get('/foodtypes', async (req, res, next) => {
        try {
            const foodtypes = await Foodtypes.findAll();
            res.send(foodtypes);
            next();
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });

    server.post('/foodtypes', async (req, res, next) => {
        try {
            const { food_type, food_type_desc, food_type_desc_la } = req.body;
            const newFoodtypes = await Foodtypes.create({
                food_type, food_type_desc, food_type_desc_la
            }).then(() => {
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next()
            });

        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });

    // Get Food Master Only
    server.get('/foodmaster', async (req, res, next) => {
        try {
            const foodmaster = await Food.findAll({
                where: {
                    parents_food_id: 0,
                    enabled_child_food: true,
                    enabled: true
                }
            })
            res.send(foodmaster);
            next();
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });
    // Kitchen
    server.get('/kitchens', async (req, res, next) => {
        try {
            const kitchens = await Kitchen.findAll();
            res.send(kitchens);
            next();
        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });
    server.post('/kitchens', async (req, res, next) => {
        try {
            const { kitchen_code, kitchen_name, responsibility_user } = req.body;
            const newKitchen = await Kitchen.create({
                kitchen_code, kitchen_name, responsibility_user
            }).then(() => {
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next()
            });

        } catch (err) {
            return next(new errors.InternalServerError(err.message));
        }
    });
}
