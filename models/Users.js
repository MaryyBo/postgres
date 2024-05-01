const { mapUsers } = require('../utils')

class User {

    // Конфігурація pg для підключення до бази даних, ми будемо передавати клієнт ззовні при створенні класу моделі User
    static _client;
    // Ім'я таблиці з якою ми працюємо
    static _tableName;

    static async findAll() {
      return await this._client.query(`SELECT * FROM ${this._tableName}`)
    }

    static async bulkCreate(usersArray) {
        // тут має бути запит до БД на створення багатьох юзерів
       return  await this._client.query( //те саме що User._client.query
            `INSERT INTO users (first_name, last_name, email, is_subscribe, gender) VALUES
            ${mapUsers(usersArray)}`
        );
    }
}


module.exports = User;