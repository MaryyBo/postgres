const { Client } = require ('pg'); // конфіги для підключення до бази даних 

const { mapUsers } = require('./utils');
 
const configs = {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'password',
    database: 'students'
}

const client = new Client (configs);

const usersArray = [
    {
        firstName: 'Mykola',
        lastName: 'Doe',
        email: 'doemike@gmail.com',
        isSubscribe: true,
        gender: 'male'
    },
    {
        firstName: 'Anna',
        lastName: 'Doe',
        email: 'doeanna@gmail.com',
        isSubscribe: true,
        gender: 'female'
    },
    {
        firstName: 'Maria',
        lastName: 'Doe',
        email: 'mary@gmail.com',
        isSubscribe: true,
        gender: 'female'
    }
]
async function runRequest () {
    await client.connect();

    const response = await client.query(
        `INSERT INTO users (first_name, last_name, email, is_subscribe, gender) VALUES
        ${mapUsers(usersArray)}`
    );

    console.log(response);

    await client.end();
}

runRequest();

