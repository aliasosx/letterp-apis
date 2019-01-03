const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');

const Status = sequelize.define('status', {
    'status': {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true
    },
    'location': {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true
    }
});
module.exports = Status;