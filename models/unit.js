const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const User = require('./User');

const Unit = sequelize.define('unit', {
    unitName: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true
    },
    unitSign: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
    },
    userId: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
});
Unit.belongsTo(User);
module.exports = Unit;