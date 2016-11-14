import React from 'react';
var $ = require("jquery");

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
                this.props.onUpdatePage((data[0] ? data[0].id : ''));
            }.bind(this),
            error: function(xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    }
    componentDidUpdate(prevProps, prevState) {
        if (prevProps.selectedCategory != this.props.selectedCategory)
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
                    this.props.onUpdatePage((data[0] ? data[0].id : ''));
                }.bind(this),
                error: function(xhr, status, err) {
                    console.error(this.props.url, status, err.toString());
                }.bind(this)
            });
        }
    }
    changePage(id) {
        this.setState((prevState, props) => ({
            pages: prevState.pages,
            selectedPage: id
        }));
        this.props.onUpdatePage(id);

    }
    render() {

        var PageLabelList = [];
        this.state.pages.forEach( (page) => {
            PageLabelList.push(
                <PageLink selectedPage={this.props.selectedPage} onChangePage={this.changePage.bind(this)} page={page} key={page.id}/>
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
    setPage(id) {
        this.props.onChangePage(id);
    }
    isActive(id) {
        return "page-label " + ( ( id == this.props.selectedPage ) ? 'active' : 'default');
    }
    render() {
        return (
            <li className={this.isActive(this.props.page.id)} onClick={this.setPage.bind(this, this.props.page.id)}>
                {this.props.page.label}
            </li>
            );
    }
};

export default PageList;
