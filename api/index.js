module.exports.getUsers = async () => {
    const response = await fetch('https://randomuser.me/api?results=500&seed=ONL-JS-PFE2023-2');
    const data = await response.json();
    // console.log(data);
    return data.results;
} 