const { Client } = require ('pg'); // конфіги для підключення до бази даних 
 
const configs = {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'password',
    database: 'students'
}

const client = new Client (configs);

async function runRequest () {
    await client.connect();

    const response = await client.query(
        `INSERT INTO users (first_name, last_name, email, is_subscribe, gender) VALUES
        ('Iron', 'Man', 'ironman@gmail.com', true, 'male');`
    );

    console.log(response);

    await client.end();
}

runRequest();

