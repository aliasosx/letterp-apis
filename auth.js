const bcrypt = require('bcryptjs');
const Sequelize = require('sequelize');
const User = require('./models/User');

exports.authenticate = (username, password) => {
    return new Promise(async (resolve, reject) => {
        try {
            //find user
            const user = await User.findOne({
                where: {
                    username: username
                }
            })
            //Match password
            bcrypt.compare(password, user.password, (err, isMatch) => {
                if (err) throw err;
                if (isMatch) {
                    resolve(user);
                } else {
                    //Password wrong
                    reject('Authentication failed');
                }
            });
        } catch (err) {
            reject('Authentication failed');
        }
    })
}