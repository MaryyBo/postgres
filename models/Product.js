class Product {
    static _client;
    static _tableName;

    static async bulkCreate(phonesArray) {
        // 1. перетворити JS-об'єкти телефонів в SQL-запит

        const valuesString = phonesArray.map(({ brand, model, price, quantity = 1, category }) =>
            `('${brand}', '${model}', '${price}', '${quantity}', '${category}')`)
            .join(',');

        // 2. виконати сам запит

        const { rows } = await this._client.query(
            `INSERT INTO ${this._tableName}
            (brand, model, price, quantity, category) VALUES
            ${valuesString} RETURNING *;`
        ); 

        // 3. Результат запиту повернути як результат роботи методу моделі
         return rows;
    }
}

module.exports = Product;