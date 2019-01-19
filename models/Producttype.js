const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const User = require('./User');

const Producttype = sequelize.define('producttype', {
    productTypeCode: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
    },
    description: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
    },
    enabled: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue: false
    },
    userId: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    updatedBy: {
        type: Sequelize.INTEGER,
        allowNull: false,
    }

});
Producttype.belongsTo(User);

module.exports = Producttype;