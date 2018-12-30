const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');

const Company = sequelize.define('company', {
    company_code: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    company_name: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    }
});
//Company.sync({ force: true });
module.exports = Company;