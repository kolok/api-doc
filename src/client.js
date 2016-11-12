import React from 'react';
import ReactDOM from 'react-dom';
var $ = require("jquery");

import CategoryMenu from "./category-menu"

class PageList extends React.Component {
    constructor(props) {
        super(props);
        this.state = {pages: [], selectedPage: ''};
    }
    componentDidMount() {
        var url = "/pages";
        if (this.props.selectedCategory)
        {
            url = "/category/" + this.props.selectedCategory+"/pages";
        }
        $.ajax({
            url: url,
            dataType: 'json',
            cache: false,
            success: function(data) {
                this.setState({pages: data, selectedPage: (data[0] ? data[0].id : '')});
            }.bind(this),
            error: function(xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    }
    componentDidUpdate(prevProps, prevState) {
        if (prevProps != this.props)
        {
            var url = "/pages";
            if (this.props.selectedCategory)
            {
                url = "/category/" + this.props.selectedCategory+"/pages";
            }
            $.ajax({
                url: url,
                dataType: 'json',
                cache: false,
                success: function(data) {
                    this.setState({pages: data, selectedPage: (data[0] ? data[0].id : '')});
                }.bind(this),
                error: function(xhr, status, err) {
                    console.error(this.props.url, status, err.toString());
                }.bind(this)
            });
        }
    }
    render() {

        var PageLabelList = [];
        this.state.pages.forEach( (page) => {
            PageLabelList.push(
                <PageLink selectedPage={this.state.selectedPage} page={page} key={page.id}/>
                );
        });
        return (
            <ul className="page-label-list">
                {PageLabelList}
            </ul>
            );
    }
};

class PageLink extends React.Component {
    isActive(id) {
        return "page-label " + ( ( id == this.props.selectedPage ) ? 'active' : 'default');
    }
    render() {
        return (
            <li className={this.isActive(this.props.page.id)}>
                {this.props.page.label}
            </li>
            );
    }
};


// Page content management

class PageContent extends React.Component {
    constructor(props) {
        super(props);
        this.state = {page: []};
    }
    componentDidMount() {
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
    }
    render() {
        return (
            <div className="page-content" dangerouslySetInnerHTML={{__html: this.state.page.content}}>
            </div>
            );
    }
};

// End of page content management

// Page title management

class PageTitles extends React.Component {
    constructor(props) {
        super(props);
        this.state = {page: []};
    }
    componentDidMount() {
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
    }
    render() {
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
};

class PageTitle extends React.Component {
    render() {
            return (
                <li className={this.props.classTag}>{this.props.titlePage}</li>
            );
    }
};

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


// Display all the page

class ApiDoc extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            selectedCategory:'',
            selectedPage:''
        };
    }
    updateCategory(id) {
        this.setState({
            selectedCategory: id,
            selectedPage:''
        });
    }
    render() {
        return ( 
            <div className="main-page">
                <CategoryMenu url="/categories" onUpdateCategory={this.updateCategory.bind(this)} />
                <div className="main-content">
                    <div className="left-panel">
                        <PageList url="category/1/pages" selectedCategory={this.state.selectedCategory} />
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
};

ReactDOM.render(
  React.createElement(ApiDoc),
  document.getElementById('root')
);

