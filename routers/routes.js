const errors = require('restify-errors');
const Role = require('../models/Role');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const Menu = require('../models/Menu');
const Tranxmenu = require('../models/Tranxmenu');
const Company = require('../models/Company');
const sequelize = require('../db/connectionInitializer');

module.exports = server => {
    // Roles
    server.get('/roles', async (req, res, next) => {
        try {
            const roles = await Role.findAll();
            res.send(roles);
            next();
        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });
    server.get('/roles/:id', async (req, res, next) => {
        try {
            const roles = await Role.findById(req.params.id);
            res.send(roles);
            next();
        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });
    server.post('/roles', async (req, res, next) => {
        console.log(req.body);
        const { role_code, role_name } = req.body;
        try {
            const roles = await Role.create({
                role_code, role_name
            }).then(() => {
                res.send(roles);
                next();
            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next();
            });

        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });
    server.put('/roles/:id', async (req, res, next) => {
        console.log(req.body);
        try {
            const { role_code, role_name } = req.body;
            const roles = await Role.update({
                role_code, role_name
            }, {
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
            return next(errors.InternalError(err.message));
        }
    });
    server.del('/roles/:id', async (req, res, next) => {
        console.log(req.body);
        try {
            const roles = await Role.destroy({
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
            return next(errors.InternalError(err.message));
        }
    });
    // Company 
    server.get('/companies', async (req, res, next) => {
        try {
            const companies = await Company.findAll();
            res.send(companies);
            next();
        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });
    server.get('/companyinfo', async (req, res, next) => {
        try {
            const companies = await Company.findAll();
            res.send(companies);
            next();
        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });
    server.get('/companies/:id', async (req, res, next) => {
        try {
            const companies = await Company.findById(req.params.id);
            res.send(companies);
            next();
        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });
    server.post('/companies', async (req, res, next) => {
        console.log(req.body);
        const { company_code, company_name } = req.body;
        try {
            const companies = await Company.create({
                company_code, company_name
            }).then(() => {
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next();
            });

        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });
    server.put('/companies/:id', async (req, res, next) => {
        console.log(req.body);
        try {
            const { company_code, company_name } = req.body;
            const companies = await Company.update({
                company_code, company_name
            }, {
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
            return next(errors.InternalError(err.message));
        }
    });
    server.del('/companies/:id', async (req, res, next) => {
        console.log(req.body);
        try {
            const companies = await Company.destroy({
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
            return next(errors.InternalError(err.message));
        }
    });
    // Menu 
    server.get('/menus', async (req, res, next) => {
        console.log(req.body);
        try {
            const menus = await Menu.findAll().then((menus) => {
                res.send(menus);
                next();
            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next();
            });
        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });
    server.get('/menus/:id', async (req, res, next) => {
        console.log(req.body);
        try {
            const menus = await Menu.findById(req.params.id).then((menus) => {
                res.send(menus);
                next();
            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next();
            });
        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });
    server.post('/menus', async (req, res, next) => {
        console.log(req.body);
        const { company_code, company_name } = req.body;
        try {
            const menu = await Menu.create({
                menu_code, menu_name
            }).then(() => {
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next();
            });

        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });
    server.put('/menus/:id', async (req, res, next) => {
        console.log(req.body);
        try {
            const { menu_code, menu_name } = req.body;
            const menus = await Menu.update({
                menu_code, menu_name
            }, {
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
            return next(errors.InternalError(err.message));
        }
    });
    server.del('/menus/:id', async (req, res, next) => {
        console.log(req.body);
        try {
            const menus = await Menu.destroy({
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
            return next(errors.InternalError(err.message));
        }
    });
    //Menu By Role
    server.get('/menubyuserid/:id', async (req, res, next) => {
        console.log(req.body);
        try {

            sequelize.query('select u.username,r.role_code, r.role_name,m.menu_code,m.menu_name,m.menu_link,m.icon from letterp.users u, letterp.roles r, letterp.menus m, letterp.tranxmenus t where  u.roleId = r.id and r.id = t.roleId and t.menuId = m.id and m.enabled=true and u.id = ?',
                { replacements: [req.params.id], type: sequelize.QueryTypes.SELECT }).then((users) => {
                    res.send(users);
                    next();
                }).catch((err) => {
                    res.send({ status: 'failed', reason: err.message });
                    next();
                });

        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
}