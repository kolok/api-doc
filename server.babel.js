import express from 'express';

const app = express();

app.use('/', express.static('public'));

var path    = require("path");

var pages = [
{id: 1, category_id:1, content: "<h1>WCM API doc</h1><h2>Getting started</h2><p>How do you start ?<br>please follow this step...</p>", parent_id: null, label: "WCM API doc"},
{id: 2, category_id:1, content: "<h1>WCM structure</h1><h2>Authentication Structure</h2><p>structure description...</p><h2>WCM product Structure</h2><p>structure description...</p>", parent_id: 1, label: "WCM Structure"},
{id: 3, category_id:1, content: "<h1>WCM routes</h1><h2>Account routes</h2><p>routes description</p>", parent_id: 1, label: "WCM API routes"},
{id: 4, category_id:2, content: "<h1>WAM API doc</h1><h2>Getting started</h2><p>How do you start ?<br>please follow this step...</p>", parent_id: null, label: "WAM API doc"},
];

var page = {id: 1, category_id:1, content: "<h1>WCM API doc</h1><h2>Getting started</h2><p>How do you start ?<br>please follow this step...</p>", parent_id: null, label: "WCM API doc"};

var categories = [
{id: 1, label:"WCM"},
{id: 2, label:"WAM"}
];

var data = {
    page: page,
    pages: pages,
    categories: categories
};

app.get('/pages', function(req, res) {
    res.setHeader('Content-Type', 'application/json');
    res.status(200).send(data.pages);
});

app.get('/page/:id', function(req, res) {
    res.setHeader('Content-Type', 'application/json');
    if (data.pages[req.params.id -1] === undefined) {
        res.status(404).send({error:"page not found"});
    }
    else {
        res.status(200).send(data.pages[req.params.id -1]);
    }
});

app.get('/categories', function(req, res) {
    res.setHeader('Content-Type', 'application/json');
    res.status(200).send(data.categories);
});

app.get('/category/:id', function(req, res) {
    res.setHeader('Content-Type', 'application/json');
    if (data.categories[req.params.id -1] === undefined) {
        res.status(404).send({error:"page not found"});
    }
    else {
        res.status(200).send(data.categories[req.params.id -1]);
    }
});


app.listen(process.env.PORT || 3000);
