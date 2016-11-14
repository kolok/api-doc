import MyDb from './db_connector/mysql';
var myDb = new MyDb();
myDb.connect();

import express from 'express';

const app = express();

app.use('/', express.static('public'));

var path    = require("path");

app.get('/pages', function(req, res) {
    res.setHeader('Content-Type', 'application/json');
    myDb.getPages( function(err, rows, fields) {
        if (err) throw err;
        res.status(200).send(rows);
    });
});

app.get('/category/:category_id/pages', function(req, res) {
    res.setHeader('Content-Type', 'application/json');
    myDb.getPagesFromCategory( req.params.category_id, function(err, rows, fields) {
        if (err) throw err;
        res.status(200).send(rows);
    });
});

app.get('/page/:id', function(req, res) {
    res.setHeader('Content-Type', 'application/json');
    myDb.getPage(req.params.id, function(err, rows, fields) {
        if (err) throw err;
        if (rows[0] === undefined){
            res.status(404).send({error:"page not found"});
        }
        else {
            res.status(200).send(rows[0]);
        }
    });
});

app.get('/categories', function(req, res) {
    res.setHeader('Content-Type', 'application/json');
    myDb.getCategories( function(err, rows, fields) {
        if (err) throw err;
        res.status(200).send(rows);
    });
});

app.listen(process.env.PORT || 3000);
