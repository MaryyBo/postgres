const { Client } = require('pg'); // конфіги для підключення до бази даних 

const { mapUsers } = require('./utils');

const { configs } = require('./configs')

const {getUsers} = require('./api');



const client = new Client(configs);


async function runRequest() {
    await client.connect();

    const usersArray = await getUsers()

    const response = await client.query(
        `INSERT INTO users (first_name, last_name, email, is_subscribe, gender) VALUES
        ${mapUsers(usersArray)}`
    );

    console.log(response);

    await client.end();
}

runRequest();



