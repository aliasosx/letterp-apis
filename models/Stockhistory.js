const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const User = require('./User');

const Stockhistory = sequelize.define('stockhistory', {
    'stockId': {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    'beforeQuantity': {
        type: Sequelize.DECIMAL,
        allowNull: false,
        defaultValue: 0
    },
    'topup': {
        type: Sequelize.DECIMAL,
        allowNull: false,
        defaultValue: 0
    },
    'currentQuantity': {
        type: Sequelize.DECIMAL,
        allowNull: false,
        defaultValue: 0
    },
    'sign': {
        type: Sequelize.STRING,
        allowNull: false
    },
    'remark': {
        type: Sequelize.STRING,
        allowNull: true,
    },
    'userId': {
        type: Sequelize.INTEGER,
        allowNull: false
    }
});
Stockhistory.belongsTo(User)
module.exports = Stockhistory;