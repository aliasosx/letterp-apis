const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const Food = require('./Food');
const Order = require('./Order');


const Orderdetail = sequelize.define('orderdetail', {
    'orderId': {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    'foodId': {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    'quantity': {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    'price': {
        type: Sequelize.DECIMAL,
        allowNull: false
    },
    'total': {
        type: Sequelize.DECIMAL,
        allowNull: false
    },
    'note': {
        type: Sequelize.STRING,
        allowNull: true
    }
});
Orderdetail.belongsTo(Food);
Orderdetail.belongsTo(Order);
module.exports = Orderdetail;