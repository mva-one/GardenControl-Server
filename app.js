const express = require('express');
const path = require('path');

const app = express();

// use pug as layout engine and look for templates in /views
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

// use static content in public directory
app.use(express.static('public'));

const indexRouter = require('./routes/index');
const nodesRouter = require('./routes/nodes');

app.use('/', indexRouter);
app.use('/nodes', nodesRouter);

module.exports = app;