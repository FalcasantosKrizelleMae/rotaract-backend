var mysql = require('../lib/mysql');

const dotenv = require('dotenv');

dotenv.config({ path: './.env' });

//Connect to Database
var db = mysql.createConnection({
   hostname: process.env.DB_HOST,
   user: process.env.DB_USER,
   password: process.env.DB_PASSWORD,
   database: process.env.DATABASE,
});

db.connect((err) => {
   if (err) {
      console.log(err);
      console.log('DB not connecteed');
   } else {
      console.log('DB Connected!');
   }
});

module.exports = db;
