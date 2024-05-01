
const {User, client } = require ('./models')

const {getUsers} = require('./api');

async function runRequest() {
    await client.connect();

    const usersArray = await getUsers()

    const response = await User.bulkCreate(usersArray)

    console.log(response);

    await client.end();
}

runRequest();



