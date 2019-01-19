const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const User = require('./User');
const Unit = require('./unit');
const Vendor = require('./vendor');
const Food = require('./Food');

const Stock = sequelize.define('stock', {
    productId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        unique: true
    },
    stockDate: {
        type: Sequelize.DATE,
        allowNull: false,
    },
    quantity: {
        type: Sequelize.DECIMAL,
        allowNull: false,
        defaultValue: 0
    },
    currentQuantity: {
        type: Sequelize.DECIMAL,
        allowNull: false,
        defaultValue: 0
    },
    expiryDate: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: 0
    },
    userId: {
        type: Sequelize.INTEGER,
        allowNull: false,
    }
});
Stock.belongsTo(User);
module.exports = Stock;