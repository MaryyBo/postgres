module.exports.getUsers = async () => {
    const response = await fetch('https://randomuser.me/api?results=500&seed=ONL&page=4');
    const data = await response.json();
    // console.log(data);
    return data.results;
} 