const _ = require('lodash');

class Order {
    static _client;
    static _tableNames;

    static async bulkCreate(usersArray, productsArray) {
        // 1 дія: створюємо нові замовлення
        // для 2 дії, повертаємо з запиту id-шники створених замовлень
        const ordersValuesString = usersArray.map(currentUser => 
            // оцей масив - всі замовлення поточного переглядаємого юзера в масиві
            // фактично, ми робимо рандомну кількість замовлень для кожного користувача
            new Array(_.random(1, 3, false)) // генеруємо від 1 до 3 замовлень для користувача
            .fill(null)
            .map(() => `(${currentUser.id})`)
            .join(',')
        ).join(',');

        const { rows: orders } = await this._client.query(
            `INSERT INTO ${this._tableNames[0]} (customer_id) VALUES ${ordersValuesString} RETURNING id;`
        );

        // 2 дія: нагенерувати позицій у кожне замовлення
        const productsToOrdersValueString = orders.map(currentOrder => {
            const positionsArray = new Array(_.random(1, 4, false)) // для кожного замовлення генеруємо від 1 до 4 позицій у чеку
            .fill(null)
            .map(() => productsArray[_.random(0, productsArray.length - 1)]) // рандомно вибираємо якийсь товар з таблиці товарів

            return [...new Set(positionsArray)]
            .map(currentProduct => `(${currentOrder.id}, ${currentProduct.id}, ${_.random(1, 3, false)})`) // рандомно вибираємо кількість товару
            .join(',');
        }).join(',');

        return await this._client.query(
            `INSERT INTO ${this._tableNames[1]} (order_id, products_id, quantity)
            VALUES ${productsToOrdersValueString};`
        );
    }
}

module.exports = Order;