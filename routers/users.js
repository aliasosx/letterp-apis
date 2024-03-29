const errors = require('restify-errors');
const Sequelize = require('sequelize');
const User = require('../models/User');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequenlize = require('../db/connectionInitializer');
const Op = Sequelize.Op;

module.exports = server => {
    server.get('/users', async (req, res, next) => {
        try {
            const users = await User.findAll();
            res.send(users);
            next();
        } catch (err) {
            return next(errors.InternalError(err.message));
        }
    });

    server.get('/usersnotin/:id', async (req, res, next) => {
        try {
            console.log(req.params.id)
            const users = await User.findAll({
                where: {
                    id: {
                        [Op.ne]: req.params.id
                    },
                    enabled: true
                }
            }).then(resp => {
                res.send(resp);
                next();
            });

        } catch (err) {
            console.log(err)
            return next(errors.InternalError(err.message));
        }
    });

    server.post('/register', async (req, res, next) => {
        console.log(req.body);
        try {
            const { gender, username, email, mobile, fullname, dateOfbirth, employed_date, photo_path, password, enabled, roleId } = req.body;
            const user = new User({
                password
            });
            bcrypt.genSalt(10, (err, salt) => {
                bcrypt.hash(user.password, salt, async (err, hash) => {
                    user.password = hash;
                    try {
                        const usr = await User.create({
                            gender, username, email, mobile, fullname, dateOfbirth, employed_date, photo_path,
                            password: user.password
                            , enabled, roleId
                        });
                        res.send({ status: 'success' });
                        next();
                    } catch (err) {
                        return next(new errors.InvalidContentError(err.message));
                    }
                });
            });

        } catch (err) {
            return next(new errors.InternalError(err.message));
        }
    });
    server.put('/changepassword/:id', async (req, res, next) => {
        try {
            const { password } = req.body;
            const user = new User({
                password
            });
            bcrypt.genSalt(10, (err, salt) => {
                bcrypt.hash(user.password, salt, async (err, hash) => {
                    user.password = hash;
                    console.log(user.password);
                    try {
                        const userx = await User.update({
                            password: user.password,
                            firstlogin: false
                        }, {
                                where: {
                                    id: req.params.id
                                }
                            });
                        res.send({ status: 'success' });
                        next();
                    } catch (err) {
                        console.log(err);
                        return next(new errors.InvalidContentError(err.message));
                    }
                });

            });
        } catch (err) {
            console.log(err);
            return next(new errors.InternalError(err.message));
        }


    });
    server.del('/users/:id', async (req, res, next) => {
        try {
            //const user = await User.findOneAndRemove({ _id: req.params.id });
            const user = await User.destroy({
                where: {
                    id: req.params.id
                }
            }).then(() => {
                console.log("******************** User destroied ******************** ");
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                res.send({ status: 'failed', reason: err.message });
                next();
            });


        } catch (err) {
            return next(new errors.InvalidContentError(err));
        }
    });
    server.put('/users/:id', async (req, res, next) => {
        console.log(req.params.id);
        console.log(req.body);
        try {
            //const user = await User.findOneAndUpdate({ _id: req.params.id }, req.body);
            const user = await User.update(req.body, {
                where: {
                    id: req.params.id
                }
            }).then(() => {
                console.log("******************** User updated ******************** ");
                res.send({ status: 'success' });
                next();
            }).catch((err) => {
                console.log(err.message);
                res.send({ status: 'failed', reason: err.message });
                next();
            });

        } catch (err) {
            return next(errors.InvalidContentError(err.message));
        }
    });
    server.get('/users/:id', async (req, res, next) => {
        try {
            const user = await User.findById(req.params.id);
            console.log(user);
            res.send(user);
            next();
        } catch (err) {
            return next(new errors.InvalidContentError(err));
        }
    });


    // Auth
    server.post('/auth', async (req, res, next) => {

        try {
            const { username, password } = req.body;
            const user = await auth.authenticate(username, password);

            //Create token

            const token = jwt.sign(user.toJSON(), config.JWT_SECRET, {
                expiresIn: '24h',
            });
            const { iat, exp } = jwt.decode(token);
            console.log(user);
            res.send({ iat, exp, token });
            next();
        } catch (err) {
            return next(new errors.UnauthorizedError(err));
        }
    });

    server.post('/authverify', async (req, res, next) => {
        console.log('Authorize module');
        try {
            const token = req.body.token;
            const token_verify = await jwt.verify(token, config.JWT_SECRET);
            res.send(token_verify);
            next();
        } catch (err) {
            return next(new errors.UnauthorizedError(err));
        }
    });
    server.get('/chefs', async (req, res, next) => {
        try {
            const chefs = sequenlize.query("select u.id, username from users u , roles r where r.id = u.roleId and r.role_code='chef'", { type: sequelize.QueryTypes.SELECT }).then((chefs) => {
                res.send(chefs);
                next();
            }).catch((err) => {
                res.send({ status: err.message });
                next();
            });

        } catch (err) {
            return next(new errors.InvalidContentError(err.message));
        }
    });
    server.get('/firstlogin/:id', async (req, res, next) => {
        try {
            const user = await User.findById(req.params.id).then(user => {
                res.send(user);
                next();
            }).catch((err) => {
                res.send({ status: err.message });
                next();
            });

        } catch (err) {
            return next(new errors.InvalidContentError(err.message));
        }
    });

}