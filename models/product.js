const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const User = require('./User');
const Unit = require('./unit');
const Vendor = require('./vendor');
const Food = require('./Food');

const Product = sequelize.define('product', {
    barcode: {
        type: Sequelize.STRING,
        allowNull: true,
    },
    productCode: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false,
    },
    productName: {
        type: Sequelize.STRING,
        unique: true,
        allowNull: false
    },
    foodId: {
        type: Sequelize.INTEGER,
        unique: false,
        allowNull: true,
    },
    vendorId: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    productTypeId: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    minimumStock: {
        type: Sequelize.DECIMAL,
        allowNull: false,
        defaultValue: 0
    },
    unitId: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    userId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    enabled: {
        type: Sequelize.BOOLEAN,
        allowNull: false
    },
    cost: {
        type: Sequelize.DECIMAL,
        allowNull: false,
        defaultValue: 0
    },
    initQuantity: {
        type: Sequelize.INTEGER,
        allowNull: false,
        defaultValue: 0
    },
    currentQuantity: {
        type: Sequelize.INTEGER,
        allowNull: false,
        defaultValue: 0
    },
    expiryDate: {
        type: Sequelize.DATE,
        allowNull: true
    }
});
Product.belongsTo(User);
Product.belongsTo(Unit);
Product.belongsTo(Vendor);
Product.belongsTo(Food);


module.exports = Product;