const restify = require('restify');
const Sequelize = require('sequelize');
const config = require('./config');
const corsMiddleware = require('restify-cors-middleware')
const rjwt = require('restify-jwt-community');

const sequelize = new Sequelize(config.MYSQL_DB, config.MYSQL_USER, config.MYSQL_PASS, {
    host: 'localhost',
    dialect: 'mysql',
    operatorsAliases: false,

    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    },

});


const server = restify.createServer({
    name: 'letter-p apis',
    version: '2.0.0'
});

// middleware

server.use(restify.plugins.bodyParser());

// Cors config

const cors = corsMiddleware({
    preflightMaxAge: 1000,
    origins: ['*'],
    allowHeaders: ['authorization'],
    exposeHeaders: []
});
server.pre(cors.preflight);
server.use(cors.actual);

//Protect router

server.use(rjwt({ secret: config.JWT_SECRET }).unless({ path: ['/auth', '/authverify', '/register'] }));

//Routing Load

require('./routers/users')(server);
require('./routers/routes')(server);

server.listen(config.PORT, () => {
    /*
    sequelize.authenticate().then(() => {
        console.log('Connection has been established successfully.');

        console.log('Server started on port ' + config.PORT);
    }).catch(err => {
        console.error('Unable to connect to the database:', err);
    });
    */
    sequelize.sync().then(() => {
        console.log('You are connected to the database successfully.');
        console.log('Server started on port ' + config.PORT);

    }).catch((err) => {
        console.log(err, "Some problems with database connection!!! " + err);
    });

});


