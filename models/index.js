/*

1. Налаштовуємо конфіг підключення до БД
2. Підключення кожної нашої моделі до БД
*/

const { Client } = require('pg');
const { configs } = require('../configs')
const User = require('./Users');
const Product = require('./Product')

// Фаршируємо модель клієнтом і назвою таблиці

const client = new Client(configs);

User._client = client;
User._tableName = 'users';

Product._client = client;
Product._tableName = 'products'

module.exports = {
    client,
    User, // готова до роботи модель
    Product // готова до роботи модель
}