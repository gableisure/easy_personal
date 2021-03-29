const { Pool } = require('pg');

const pool = new Pool({
  user: 'boqcuwzvvkvqqi',
  host: 'ec2-54-164-22-242.compute-1.amazonaws.com',
  database: 'd26t916m12anua',
  password: '03b40d13599d203ed3972c6f32815218735e8ca2658f8ab069fb189d7c285efb',
  port: 5432,
  ssl: { rejectUnauthorized: false },
});

pool
  .connect()
  .then(client => {
    console.log('DB connected!');
    client.release();
  })
  .catch(err => console.log(err));

exports.query = (text, param) => pool.query(text, param);
