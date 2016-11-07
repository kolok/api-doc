import React from 'react';
import ReactDOM from 'react-dom';
var $ = require("jquery");

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
]

var data = {
    page: page,
    pages: pages,
    categories: categories
};

var PageList = React.createClass({
    render: function() {
        var PageLabelList = this.props.pages.map( function(page) {
            return (
                <li className="page-label" key={page.id}>{page.label}</li>
                );
        });
        return (
            <ul className="page-label-list">
                {PageLabelList}
            </ul>
            );
    }
});

// Page content management

var PageContent = React.createClass({
    render: function() {
        return (
            <div className="page-content" dangerouslySetInnerHTML={{__html: this.props.page.content}}>
            </div>
            );
    }
});

// End of page content management

// Page title management

var PageTitles = React.createClass({
    render: function() {
        var matches = getTitles(this.props.page.content);
        var i = 0;
        var PageTitleList2 = matches.map( function(match){
            i+=1;
            var classTag = match[0];
            var titlePage = match[1];
            var key = classTag+'-'+titlePage;
            return (
                <PageTitle key={key} classTag={classTag} titlePage={titlePage} />
                );
        });
        return (
            <ul className="page-titles">
                {PageTitleList2}
            </ul>
            );
    }
});

var PageTitle = React.createClass({
    render: function() {
            return (
                <li className={this.props.classTag}>{this.props.titlePage}</li>
            );
    }
});

function getTitles(content) {
    var myRegexp = /\<(h\d)\>([\w\s]*)\<\/h\d\>/;
    var matches = [];
    var match = myRegexp.exec(content);
    while (match = myRegexp.exec(content)) {
        matches.push([match[1], match[2]]);
        content = content.replace(myRegexp, "");
    }
    return matches;
}

// End of page title management


// Main menu management

var CategoryMenu = React.createClass({
    getInitialState: function() {
        return {selectedCategory:'1',categories: []};
    },
    componentDidMount: function() {
        $.ajax({
            url: this.props.url,
            dataType: 'json',
            cache: false,
            success: function(data) {
                this.setState({selectedCategory:this.state.selectedCategory,categories: data});
            }.bind(this),
            error: function(xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    },
    changeCategory: function(id){
        this.setState({
            categories: this.state.categories,
            selectedCategory: id
        });
    },
    render: function() {
        var Menu = [];
        this.state.categories.forEach((category) => {
            Menu.push(
                <CategoryLink selectedCategory={this.state.selectedCategory} onChangeCategory={this.changeCategory} category={category} key={category.id}/>
                );
        });
        return (
            <div className="menu">
            {Menu}
            </div>
            );
    }
});

var CategoryLink = React.createClass({
    getInitialState: function(){
        return {
            selected:''
        }
    },
    setCategory: function(id) {
        this.setState({selected: id});
        this.props.onChangeCategory(id);
    },
    isActive: function(value) {
        return "menu-item " + ( ( value === this.props.selectedCategory ) ? 'active' : 'default' )
    },
    render: function() {
        return (
            <div className={this.isActive(this.props.category.id)} onClick={this.setCategory.bind(this, this.props.category.id)}>
                {this.props.category.label}
            </div>
            );
    }
});

// end of main menu management

// Display all the page

var ApiDoc = React.createClass({
    render: function() {
        return ( 
            <div className="main-page">
                <CategoryMenu url="/categories" />
                <div className="main-content">
                    <div className="left-panel">
                        <PageList pages={this.props.data.pages} />
                    </div>
                    <div className="main-panel">
                        <PageContent page={this.props.data.page} />
                    </div>
                    <div className="right-panel">
                        <PageTitles page={this.props.data.page} />
                    </div>
                    <div className="footer">
                    </div>
                </div>
            </div>
            );
    }
});







ReactDOM.render(
  React.createElement(ApiDoc, data={data}),
  document.getElementById('root')
);

