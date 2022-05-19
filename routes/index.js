const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.render('index', {title: 'Gctl ALPHA'});
});

module.exports = router;
