
const { User, Product, Order, client } = require('./models')
const { getUsers } = require('./api');
const { generatePhones } = require('./utils');
const { findAll } = require('./models/Product');

async function runRequest() {
    await client.connect();


    // Генерація юзерів
    // const usersArray = await getUsers()
    // const response = await User.bulkCreate(usersArray)
    // console.log(response);

    //Генератор товарів

    // const phonesArray = await generatePhones(400);
    // const response = await Product.bulkCreate (phonesArray)

    // Генератор замовлень 

    const { rows: usersArray } = await User.findAll(); // Всі юзери з таблиці Users
    const { rows: productsArray } = await Product.findAll(); // Всі товари з таблиці products
    const response = await Order.bulkCreate(usersArray, productsArray);


    console.log(response);

    await client.end();
}

runRequest();



