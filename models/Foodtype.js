const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');

const Foodtype = sequelize.define('foodtype', {
    food_type: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    food_type_desc: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    food_type_desc_la: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    }
});
//Foodtype.sync();
module.exports = Foodtype;