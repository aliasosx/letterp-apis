const restify = require('restify');
const Sequelize = require('sequelize');
const config = require('./config');
const corsMiddleware = require('restify-cors-middleware')
const rjwt = require('restify-jwt-community');
const fs = require('fs');
const sequelize = require('./db/connectionInitializer');
const https_ops = {
    key: fs.readFileSync('./certs/ssl/server.key'),
    certificate: fs.readFileSync('./certs/ssl/server.cert')
}
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

server.use(rjwt({ secret: config.JWT_SECRET }).unless({ path: ['/auth', '/register', '/authverify', '/uploads'] }));

//Routing Load

require('./routers/users')(server);
require('./routers/routes')(server);
require('./routers/foods')(server);
require('./routers/orders')(server);
require('./routers/customers')(server);
require('./routers/reports')(server);
require('./routers/cashloads')(server);
require('./routers/stocks')(server);
require('./routers/purchases')(server);
//static images


server.get('/uploads/*', restify.plugins.serveStatic({
    directory: './public',

}))
server.listen(config.PORT, () => {

    sequelize.sync().then(() => {
        console.log('You are connected to the database successfully.');
        console.log('Server started on port ' + config.PORT);
    }).catch((err) => {
        console.log(err, "Some problems with database connection!!! " + err);
    });

});


