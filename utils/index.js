
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
    return usersArray.map ((currentUser) => `('${currentUser.firstName}', '${currentUser.lastName}', '${currentUser.email}', ${currentUser.isSubscribe}, '${currentUser.gender}')`)
    .join(',')
}