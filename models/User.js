const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');

const Role = require('./Role');

const User = sequelize.define('user', {

    employee_code: {
        type: Sequelize.UUID,
        unique: true,
        defaultValue: Sequelize.UUIDV4

    },
    gender: Sequelize.STRING,
    username: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    email: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    mobile: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    fullname: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    dateOfbirth: {
        type: Sequelize.DATE,
        allowNull: false
    },
    employed_date: {
        type: Sequelize.DATE,
        allowNull: false
    },
    photo_path: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },

    password: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    enabled: {
        type: Sequelize.BOOLEAN,
        defaultValue: true,
        allowNull: false
    }
});
User.belongsTo(Role);
//User.sync({ force: true });
module.exports = User;