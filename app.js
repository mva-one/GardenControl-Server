import express from 'express';
import path from 'path';

const app = express();
export default app;

// use pug as layout engine and look for templates in /views
app.set('views', './views');
app.set('view engine', 'pug');

// use static content in public directory
app.use(express.static('public'));

import indexRouter from './routes/index.js';
import nodeRouter from './routes/node.js';
import actorRouter from './routes/actor.js';

app.use('/', indexRouter);
app.use('/nodes', nodeRouter);
app.use('/actors', actorRouter);