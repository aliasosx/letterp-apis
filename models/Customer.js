const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');

const Customer = sequelize.define('customer', {
    'customer_code': {
        type: Sequelize.UUID,
        unique: true,
        defaultValue: Sequelize.UUIDV4
    },
    'gender': {
        type: Sequelize.CHAR(1),
        allowNull: false
    },
    'fullname': {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    'dateOfBirth': {
        type: Sequelize.DATE,
        allowNull: false
    },
    'currentAddress': {
        type: Sequelize.STRING,
        allowNull: false
    },
    'tel': {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    'email': {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    'photo': {
        type: Sequelize.STRING,
        allowNull: false
    },
    'registeredDate': {
        type: Sequelize.DATE,
        allowNull: false
    },
    'active': {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue: true
    }
});
module.exports = Customer;