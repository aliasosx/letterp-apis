const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const User = require('./User');
const Stock = require('./stock');

const Stocktracking = sequelize.define('stocktracking', {
    stockId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    beforeQuantity: {
        type: Sequelize.DECIMAL,
        allowNull: false,
        defaultValue: 0
    },
    used: {
        type: Sequelize.DECIMAL,
        allowNull: false,
        defaultValue: 0
    },
    userId: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
});
Stocktracking.belongsTo(Stock);
Stocktracking.belongsTo(User);

module.exports = Stocktracking;