const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');

const Kitchen = sequelize.define('kitchen', {
    kitchen_code: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    kitchen_name: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    userId: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    }
});
//Kitchen.sync();
module.exports = Kitchen;