import fetch from 'node-fetch';
import express from 'express';
const router = express.Router();

router.get('/', async (req, res) => {
    const response = await fetch('http://localhost:3000/actor');
    const actors = await response.json();
    res.render('actors', {title: 'Actors - Gctl ALPHA', actors} );
});

export default router;