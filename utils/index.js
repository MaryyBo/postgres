
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

module.exports.mapUsers = (usersArray) => {
    return usersArray.map(({ name: { first, last }, gender, email }) =>
        `('${first}', '${last}', '${email}', ${Boolean(Math.random() > 0.5)}, '${gender}')`)
        .join(',')
}