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

app.get('/category/:category_id/page_tree', function(req, res) {
    res.setHeader('Content-Type', 'application/json');
    myDb.getPagesFromCategory( req.params.category_id, function(err, rows, fields) {
        if (err) throw err;
        var tree = buildTreeFromRows(rows);
        res.status(200).send(tree);
    });
});

app.get('/page_tree', function(req, res) {
    res.setHeader('Content-Type', 'application/json');
    myDb.getPages( function(err, rows, fields) {
        if (err) throw err;
        res.status(200).send(rows);
    });
});


// Build the Tree from rows
function buildTreeFromRows(rows){
    var tree = [];

    //iterate on rows until all rows are set in the tree
    while (rows.length > 0)
    {
        var result = buildTree(tree,rows);
        tree = result[0];
        rows = result[1];
    }
    return tree;
}

//initiate the first level of the tree (without parent)
//and call recurcive function to set the row to the right place
function buildTree(tree, rows)
{
    //collect id of rows
    var h = {};
    for(var i = 0; i < rows.length ; i++ ) {
        delete rows[i].content;
        h[rows[i].id] = rows[i];
    }
    //root ids
    var newRows = [];
    for(var i = 0; i < rows.length ; i++ ) {
        if (tree.length == 0) {
            if (h[rows[i].parent_id] == null)
            {
                tree.push(rows[i]);
            }
            else
            {
                newRows.push(rows[i]);
            }
        }
        else
        {
            // push on the right place in tree
            var incremented = false;
            [tree,incremented] = incrementTree(tree, rows[i]);
            if (!incremented) {
                // if we don't find the parent, we repush it on the rows to process
                newRows.push(rows[i]);
            }
        }

    }
    return [tree, newRows];
}

//recurcive function to set the data to the right place in the tree
function incrementTree(tree,row)
{
    var incremented = false;
    for(var i = 0 ; i < tree.length ; i++) {
        if (tree[i].id == row.parent_id) {
            if (tree[i].list == null) {
                tree[i].list = [];
            }
            tree[i].list.push(row);
            incremented = true;
        }
    }
    if (!incremented)
    {
        for(var i = 0 ; i < tree.length ; i++) {
            if (tree[i].list !== undefined && tree[i].list.length > 0) {
                var result = incrementTree(tree[i].list,row);
                var newTree = result[0];
                incremented = result[1];
                if (incremented)
                {
                    tree[i].list = newTree;
                    break;
                }
            }
        }
    }

    return [tree,incremented];
}

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
