var mysql = require('mysql');

const dotenv = require('dotenv');

dotenv.config({ path: './.env' });

//Connect to Database
var db = mysql.createConnection({
   user: process.env.DB_USER,
   host: process.env.DB_HOST,
   password: process.env.DB_PASSWORD,
   database: process.env.DATABASE,
   port: 3306,
});

db.connect((err) => {
   if (err) {
      console.log(err);
   } else {
      console.log('DB Connected!');
   }
});

module.exports = db;
