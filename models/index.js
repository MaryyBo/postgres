/*

1. Налаштовуємо конфіг підключення до БД
2. Підключення кожної нашої моделі до БД
*/

const { Client } = require('pg'); 
const { configs } = require('../configs')
const User = require('./Users');

const client = new Client(configs);

User._client = client;
User._tableName = 'users';

module.exports = {
    client,
    User // готова до роботи модель
}