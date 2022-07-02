import fetch from 'node-fetch';
import express from 'express';
const router = express.Router();

router.get('/', async (req, res) => {
    const response = await fetch('http://localhost:3000/node');
    const nodes = await response.json();
    res.render('nodes', {title: 'Nodes - Gctl ALPHA', nodes} );
});

export default router;