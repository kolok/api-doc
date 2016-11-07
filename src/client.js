import React from 'react';
import ReactDOM from 'react-dom';
var $ = require("jquery");

var PageList = React.createClass({
    getInitialState: function() {
        return {pages: []};
    },
    componentDidMount: function() {
        $.ajax({
            url: this.props.url,
            dataType: 'json',
            cache: false,
            success: function(data) {
                this.setState({pages: data});
            }.bind(this),
            error: function(xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    },
    render: function() {
        var PageLabelList = this.state.pages.map( function(page) {
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
    getInitialState: function() {
        return {page: {}};
    },
    componentDidMount: function() {
        $.ajax({
            url: this.props.url,
            dataType: 'json',
            cache: false,
            success: function(data) {
                this.setState({page: data});
            }.bind(this),
            error: function(xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    },
    render: function() {
        return (
            <div className="page-content" dangerouslySetInnerHTML={{__html: this.state.page.content}}>
            </div>
            );
    }
});

// End of page content management

// Page title management

var PageTitles = React.createClass({
    getInitialState: function() {
        return {page: {}};
    },
    componentDidMount: function() {
        $.ajax({
            url: this.props.url,
            dataType: 'json',
            cache: false,
            success: function(data) {
                this.setState({page: data});
            }.bind(this),
            error: function(xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    },
    render: function() {
        var matches = getTitles(this.state.page.content);
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
        this.props.onUpdateCategory(id);
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
    setCategory: function(id) {
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
    getInitialState: function(){
        return {
            selectedCategory:'',
            selectedPage:''
        }
    },
    updateCategory: function(id) {
        this.setState({
            selectedCategory: id,
            selectedPage:''
        });
    },
    render: function() {
        return ( 
            <div className="main-page">
                <CategoryMenu url="/categories" onUpdateCategory={this.updateCategory} />
                <div className="main-content">
                    <div className="left-panel">
                        <PageList url="/pages" selectedCategory={this.state.selectedCategory} />
                    </div>
                    <div className="main-panel">
                        <PageContent url="/page/2" selectedPage={this.state.selectedPage} />
                    </div>
                    <div className="right-panel">
                        <PageTitles url="/page/2" selectedPage={this.state.selectedPage} />
                    </div>
                    <div className="footer">
                    </div>
                </div>
            </div>
            );
    }
});

ReactDOM.render(
  React.createElement(ApiDoc),
  document.getElementById('root')
);

