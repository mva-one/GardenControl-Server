const express = require('express');
const router = express.Router();
const db = require('../db');

router.get('/', (req, res) => {
    // var nodes = [ { "nid": "1", "host": "h1", "descr": "descr1" }, { "nid": "2", "host": "h2", "descr": "descr2" } ]
    // var nodes = db.query('SELECT nid, host, descr FROM gctl_node');
    let nodes = db.query();
    console.log(nodes);
    res.render('nodes', {title: 'Nodes - Gctl ALPHA', nodes} );
});

module.exports = router;
