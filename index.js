
const { User, Product, client } = require('./models')
const { getUsers } = require('./api');
const { generatePhones } = require('./utils')

async function runRequest() {
    await client.connect();


    // Генерація юзерів
    // const usersArray = await getUsers()
    // const response = await User.bulkCreate(usersArray)
    // console.log(response);

    //Генератор товарів

    const phonesArray = await generatePhones(400);
    const response = await Product.bulkCreate (phonesArray)
    console.log(response);
    
    await client.end();
}

runRequest();



