const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');

const Cashload = sequelize.define('cashload', {
    startamount: {
        type: Sequelize.DECIMAL,
        allowNull: false
    },
    saleamount: {
        type: Sequelize.DECIMAL,
        allowNull: true
    },
    closeamount: {
        type: Sequelize.DECIMAL,
        allowNull: true
    },
    balance: {
        type: Sequelize.DECIMAL,
        allowNull: true
    },
    closed: {
        type: Sequelize.BOOLEAN,
        defaultValue: false
    },
    loaddatetime: {
        type: Sequelize.DATE,
        allowNull: false
    },
    closedatetime: {
        type: Sequelize.DATE
    },
    userId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    checkerId: {
        type: Sequelize.INTEGER,
        allowNull: true
    }
});
module.exports = Cashload;