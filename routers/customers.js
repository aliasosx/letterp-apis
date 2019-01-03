const errors = require('restify-errors');
const bcrypt = require('bcryptjs');
const auth = require('../auth');
const jwt = require('jsonwebtoken');
const config = require('../config');
const sequelize = require('../db/connectionInitializer');

const Customer = require('../models/Customer');

module.exports = server => {
    server.get('/customers', async (req, res, next) => {
        const customers = await Customer.findAll();
        res.send(customers);
        next();
    });
}
