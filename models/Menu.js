const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');

const Menu = sequelize.define('menu', {
    menu_code: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    menu_name: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    icon: {
        type: Sequelize.STRING,
        allowNull: false
    }
});
//Menu.sync({ force: true });
module.exports = Menu;