const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');

const Tranxmenu = sequelize.define('tranxmenu', {
    roldId: {
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
//Tranxmenu.sync({ force: true });
module.exports = Tranxmenu;