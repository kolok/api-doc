import React from 'react';
import ReactDOM from 'react-dom';
var $ = require("jquery");

import CategoryMenu from "./category-menu"
import PageList from "./page-list"
import PageContent from "./page-content"
import PageTitles from "./page-titles"

class ApiDoc extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            selectedCategory:'',
            selectedPage:'',
            page: ''
        };
    }
    updateCategory(id) {
        //console.log(id);
        this.setState((prevState, props) => ({
            selectedCategory: id,
            selectedPage: prevState.selectedPage,
            page: prevState.page
        }));
    }
    updatePage(id) {
        if (id !== '')
        {
            var url = "/page/" + id;
            $.ajax({
                url: url,
                dataType: 'json',
                cache: false,
                success: function(data) {
                    this.setState((prevState, props) => ({
                        selectedCategory: prevState.selectedCategory,
                        selectedPage: id,
                        page: data
                    }));
                }.bind(this),
                error: function(xhr, status, err) {
                    console.error(this.props.url, status, err.toString());
                }.bind(this)
            });
        }
        else
        {
            this.setState((prevState, props) => ({
                selectedCategory: prevState.selectedCategory,
                selectedPage: '',
                page: ''
            }));
        }
    }
    render() {
        return ( 
            <div className="main-page">
                <div className="main-header">
                    <img src="images/React.png"/>
                    <CategoryMenu url="/categories" onUpdateCategory={this.updateCategory.bind(this)} />
                </div>
                <div className="main-content">
                    <div className="left-panel">
                        <PageList url="category/1/pages" selectedPage={this.state.selectedPage} selectedCategory={this.state.selectedCategory} onUpdatePage={this.updatePage.bind(this)} />
                    </div>
                    <div className="main-panel">
                        <PageContent selectedPage={this.state.selectedPage} page={this.state.page} />
                    </div>
                    <div className="right-panel">
                        <PageTitles url="/page/1" selectedPage={this.state.selectedPage} page={this.state.page}/>
                    </div>
                    <div className="footer">
                    </div>
                </div>
                <div className="main-footer">
                    <p> footer : this is a footer, feel free to add your own useful information...</p>
                </div>
            </div>
            );
    }
};

ReactDOM.render(
  React.createElement(ApiDoc),
  document.getElementById('root')
);

