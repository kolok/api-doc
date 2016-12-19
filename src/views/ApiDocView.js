'use strict';

import React from 'react';

import classnames from 'classnames';

function ApiDocView(props) {
    return (
        <div className="main-page">
            <div className="main-header">
                <img src="images/React.png"/>
                <CategoryMenu {...props}/>
            </div>
            <div className="main-footer">
                <p> footer : this is a footer, feel free to add your own useful information...</p>
            </div>
        </div>
  );
}

function CategoryMenu(props) {
    var Menu = [];
    ['cat1','cat2','cat3'].forEach((category) => {
        Menu.push(
            <CategoryLink category={category} key={category}/>
            );
    });
    return (
            <div className="menu">
            {props.category}
            </div>
           );
}

function CategoryLink(props) {
    return (
            <div>
            {props.category}
            </div>
           );
}


export default ApiDocView;
