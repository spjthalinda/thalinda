nano kyc.js
const fs = require('fs');

const data = {
  name: "Thalinda",
  id: "1149900265316",
  passport: "AC2218918",
  birthdate: "1992-07-10",
  wallet: "0x1234567890abcdef",
  balance: 10.5
};

fs.writeFile('userdata.json', JSON.stringify(data, null, 2), (err) => {
  if (err) {
    console.error('Error writing file:', err);
  } else {
    console.log('File saved successfully.');
  }
});

