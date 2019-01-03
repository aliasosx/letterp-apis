const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');

const Ticket = sequelize.define('ticket', {
    'tick_number': {
        type: Sequelize.INTEGER,
        unique: true,
        allowNull: false
    },
    'ticket_available': {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue: true
    },
    'enabled': {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue: true
    }
});

module.exports = Ticket;