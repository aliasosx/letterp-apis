const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const User = require('./User');

const Vendor = sequelize.define('vendor', {
    contactPerson: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true
    },
    shopName: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true
    },
    address: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true
    },
    tel: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true
    },
    mobile: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true
    },
    enabled: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue: false
    }
});
Vendor.belongsTo(User);