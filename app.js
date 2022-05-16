const express = require('express');
const path = require('path');
const routes = require('./routes/index');

const app = express();

// use pug as layout engine and look for templates in /views
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

// use static content in public directory
app.use(express.static('public'));

app.use('/', routes);

module.exports = app;