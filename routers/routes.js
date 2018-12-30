const errors = require('restify-errors');
const Role = require('../models/Role');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const Menu = require('../models/Menu');
const Tranxmenu = require('../models/Tranxmenu');
const Company = require('../models/Company');


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

}