const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'easy_personal',
  password: 'admin123',
  port: 5432,
});

pool
  .connect()
  .then(client => {
    console.log('DB connected!');
    client.release();
  })
  .catch(err => console.log(err));

exports.query = (text, param) => pool.query(text, param);
