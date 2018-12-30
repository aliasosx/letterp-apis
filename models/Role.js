const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const User = require('./User');

const Role = sequelize.define('role', {

    role_code: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    role_name: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    }
});
//Role.sync({ force: true });
module.exports = Role;