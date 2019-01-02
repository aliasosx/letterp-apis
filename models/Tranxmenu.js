const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const Menu = require('./Menu');


const Tranxmenu = sequelize.define('tranxmenu', {
    roleId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    menuId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    createdBy: {
        type: Sequelize.STRING,
        allowNull: false
    }

});

Tranxmenu.belongsTo(Menu)
module.exports = Tranxmenu;