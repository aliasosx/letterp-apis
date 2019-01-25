const sequelize = require('../db/connectionInitializer');
const Sequelize = require('sequelize');
const User = require('./User');
const Vendor = require('./vendor');
const Product = require('./product');

const Purchase = sequelize.define('purchase', {
    refno: {
        type: Sequelize.STRING,
        allowNull: true
    },
    productId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    quantity: {
        type: Sequelize.DECIMAL,
        allowNull: false,
    },
    purchaseDate: {
        type: Sequelize.DATE,
        allowNull: false
    },
    invoiceNo: {
        type: Sequelize.STRING,
        allowNull: true
    },
    vendorId: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    userId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    price: {
        type: Sequelize.DECIMAL,
        allowNull: false
    }
});
Purchase.belongsTo(Product);
Purchase.belongsTo(User);
Purchase.belongsTo(Vendor);
module.exports = Purchase;