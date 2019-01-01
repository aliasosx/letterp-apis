const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const FoodType = require('./Foodtype');
const Kitchen = require('./Kitchen');
const User = require('./User');


const Food = sequelize.define('food', {
    food_name: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    parents_food_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        default: 0
    },
    photo: {
        type: Sequelize.STRING,
        allowNull: false
    },
    foodtypeId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    cost: {
        type: Sequelize.DECIMAL,
        allowNull: false,
        default: 0
    },
    price: {
        type: Sequelize.DECIMAL,
        allowNull: false,
        default: 0
    },
    currcode: {
        type: Sequelize.INTEGER,
        allowNull: false,
        default: 418
    },
    enabled: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        default: true
    },

    kitchenId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    enabled_child_food: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        default: false
    },
    userId: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
});
Food.belongsTo(FoodType);
Food.belongsTo(Kitchen);
Food.belongsTo(User);
Food.sync();
module.exports = Food;