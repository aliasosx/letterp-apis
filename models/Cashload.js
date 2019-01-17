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
    loadcheckerId: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    closecheckerId: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    loaded: {
        type: Sequelize.BOOLEAN,
        allowNull: false
    },
    note: {
        type: Sequelize.STRING,
        allowNull: true
    },
    cleared: {
        type: Sequelize.BOOLEAN,
        allowNull: true
    },
    cashloaddate: {
        type: Sequelize.DATEONLY,
        allowNull: true
    }
});
module.exports = Cashload;