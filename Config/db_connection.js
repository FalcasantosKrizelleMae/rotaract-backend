var mysql = require('mysql');
//Connect to Database
var db = mysql.createPool({
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
