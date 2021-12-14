var mysql = require('mysql');

const dotenv = require('dotenv');

dotenv.config({ path: './.env' });

//Connect to Database
var db = mysql.createConnection({
   host: 'us-cdbr-east-05.cleardb.net',
   user: 'b81b197e25d54a',
   password: 'bb7f0480',
   database: 'heroku_4c7d942fdcea2e2',
});

db.connect((err) => {
   if (err) {
      console.log(err);
   } else {
      console.log('DB Connected!');
   }
});

module.exports = db;
