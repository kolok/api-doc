import React from 'react';
var $ = require("jquery");

// Main menu management

class CategoryMenu extends React.Component {
    constructor(props) {
        super(props);
        this.state = {selectedCategory:'1',categories: []};
    }
    componentDidMount() {
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
    }
    changeCategory(id) {
        this.setState((prevState, props) => ({
            categories: prevState.categories,
            selectedCategory: id
        }));
        this.props.onUpdateCategory(id);
    }
    render() {
        var Menu = [];
        this.state.categories.forEach((category) => {
            Menu.push(
                <CategoryLink selectedCategory={this.state.selectedCategory} onChangeCategory={this.changeCategory.bind(this)} category={category} key={category.id}/>
                );
        });
        return (
            <div className="menu">
            {Menu}
            </div>
            );
    }
};

class CategoryLink extends React.Component {
    setCategory(id) {
        this.props.onChangeCategory(id);
    }
    isActive(value) {
        return "menu-item " + ( ( value === this.props.selectedCategory ) ? 'active' : 'default' )
    }
    render() {
        return (
            <div className={this.isActive(this.props.category.id)} onClick={this.setCategory.bind(this, this.props.category.id)}>
                {this.props.category.label}
            </div>
            );
    }
};

// end of main menu management


export default CategoryMenu;
