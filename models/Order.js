const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const User = require('./User');
const Ticket = require('./Ticket');
const Status = require('./Status');
const Customer = require('./Customer');

const Order = sequelize.define('order', {
    'orderRefno': {
        type: Sequelize.UUID,
        unique: true,
        defaultValue: Sequelize.UUIDV4
    },
    'order_datetime': {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
    },
    'finish_datetime': {
        type: Sequelize.DATE,
        allowNull: true
    }
    ,
    'quantity': {
        type: Sequelize.INTEGER,
        allowNull: false,
        defaultValue: 0
    },
    'grandtotal': {
        type: Sequelize.DECIMAL,
        allowNull: false,
        defaultValue: 0,
    },
    'ticketId': {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    'statusId': {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    'received': {
        type: Sequelize.DECIMAL,
        defaultValue: 0
    },
    'change': {
        type: Sequelize.DECIMAL,
        defaultValue: 0
    },
    'customerId': {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    'userId': {
        type: Sequelize.INTEGER,
        allowNull: false
    }
});
Order.belongsTo(User);
Order.belongsTo(Ticket);
Order.belongsTo(Status);
Order.belongsTo(Customer);

module.exports = Order;