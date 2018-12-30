const errors = require('restify-errors');
const User = require('../models/User');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');

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
        const token = req.body.token;
        try {
            const token_verify = await jwt.verify(token, config.JWT_SECRET);
            res.send(token_verify);
            next();
        } catch (err) {
            return next(new errors.UnauthorizedError(err));
        }
    });




}