
class MyDb {
    constructor() {
        this.mysql      = require('mysql');
        this.connection = this.mysql.createConnection({
            host       : '127.0.0.1',
            user       : 'root',
            password   : 'root',
            database   : 'api_doc'
        });
    }
    connect() {
        this.connection.connect();
    }
    getCategories(callback) {
        this.connection.query('SELECT * from categories', function(err, rows, fields){ 
            callback(err, rows, fields);
        });
    }
    getPages(callback) {
        this.connection.query('SELECT * from pages', function(err, rows, fields){ 
            callback(err, rows, fields);
        });
    }
    getPagesFromCategory(category_id,callback) {
        this.connection.query('SELECT * from pages where category_id = ' + category_id, function(err, rows, fields) {
            callback(err, rows, fields);
        });
    }
    getPage(id, callback) {
        this.connection.query('SELECT * from pages where id = ' + id, function(err, rows, fields) {
            callback(err,rows,fields);
        });
    }

}


export default MyDb;
