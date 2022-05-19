/* const { Pool } = require('pg');
const pool = new Pool(require('./secret/db.json'));

async function query(query) {
    const {rows, fields} = await pool.query(query);
    return rows;
}

module.exports = {
  query
} */

function query() {
  /* const { Client } = require('pg');
  const client = new Client(require('./secret/db.json'));

  await client.connect();

  const res = await client.query('SELECT nid, host, descr FROM gctl_node');
  console.log("QUERRRRRY:");
  console.log(res.rows);

  // await client.end(); */

  return [
    { nid: 1, host: 'node1:4242', descr: 'Node South-East' },
    { nid: 2, host: 'node-north:4242', descr: 'Node North' },
    { nid: 3, host: 'sense-node:4242', descr: 'Sensors' }
  ]
}

module.exports = {
  query
}
