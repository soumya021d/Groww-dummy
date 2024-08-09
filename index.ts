import express from 'express';
import { Client } from 'pg';

const app = express();
const port = 3000;

// PostgreSQL client setup
const client = new Client({
  user: 'yourusername',
  host: 'localhost',
  database: 'groww',
  password: 'yourpassword',
  port: 5432,
});

client.connect();

app.get('/portfolio', async (req, res) => {
  try {
    const result = await client.query('SELECT * FROM portfolio');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
