const express = require('express');
const { Pool } = require('pg');

const router = express.Router();

const pool = new Pool(require('../secret/db.json'))

var nodes;

pool.query('SELECT * FROM gctl_node', (err, res) => {
    console.log(err, res)
    nodes = res.rows; 
    pool.end() 
})

router.get('/', (req, res) => {
  res.render('index', {title: 'Gctl ALPHA'});
});

router.get('/nodes', (req, res) => {
    // var nodes = [{ nid: 'T1', descr: 'D1' }];
    console.log({title: 'Nodes - Gctl ALPHA', nodes});
    res.render('nodes', {title: 'Nodes - Gctl ALPHA', nodes});
  });

module.exports = router;
