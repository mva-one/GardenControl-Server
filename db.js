const { Pool } = require('pg');
const pool = new Pool(require('./secret/db.json'));

async function query(query) {
    const {rows, fields} = await pool.query(query);
    return rows;
}

module.exports = {
  query
}