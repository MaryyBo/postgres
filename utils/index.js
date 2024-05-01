
/*
Це запит на 1 користувача:
const response = await client.query(
        `INSERT INTO users (first_name, last_name, email, is_subscribe, gender) VALUES
        ('${user.firstName}', '${user.lastName}', '${user.email}', ${user.isSubscribe}, '${user.gender}');`
    );
    
А нам потрібно багато    

const response = await client.query(
        `INSERT INTO users (first_name, last_name, email, is_subscribe, gender) VALUES
        
        ('${user.firstName}', '${user.lastName}', '${user.email}', ${user.isSubscribe}, '${user.gender}');`
    ),
    ('${user.firstName}', '${user.lastName}', '${user.email}', ${user.isSubscribe}, '${user.gender}');`
    ),
    ('${user.firstName}', '${user.lastName}', '${user.email}', ${user.isSubscribe}, '${user.gender}');`
    );
*/

const _ = require('lodash')

module.exports.mapUsers = (usersArray) => {
    return usersArray.map(({ name: { first, last }, gender, email }) =>
        `('${first}', '${last}', '${email}', ${Boolean(Math.random() > 0.5)}, '${gender}')`)
        .join(',')
}


const PHONES_BRANDS = [
    'Samsung',
    'Iphone',
    'Xioami',
    'Sony',
    'Huawei',
    'Nokia'
];

const generateOnePhone = modelNumber => ({ // об'єкт товару, який ми будемо додавати до таблиці products
    brand: PHONES_BRANDS[_.random(0, PHONES_BRANDS.length - 1, false)],
    model: `model ${modelNumber}`,
    quantity: _.random(10, 1500, false),
    price: _.random(150, 10000, false),
    category: 'phones'
})

module.exports.generatePhones = (phonesCount = 100) => {
    const phonesArray = [];

    for (let i = 0; i < phonesCount; i++) {
        phonesArray.push(generateOnePhone(i));
    }
    return phonesArray;

}