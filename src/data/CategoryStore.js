'use strict';

import {ReduceStore} from 'flux/utils';
import ApiDocActionTypes from './ApiDocActionTypes';
import ApiDocDispatcher from './ApiDocDispatcher';

var $ = require("jquery");

class CategoryStore extends ReduceStore {
    constructor() {
        super(ApiDocDispatcher);
    }

    getInitialState(): State {
        $.ajax({
            url: "/categories",
            dataType: 'json',
            cache: false,
            success: function(data) {
                console.log(data);
                return {
                    selectedCategory:0,
                    categories: data
                };
            }.bind(this),
            error: function(xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    }

    reduce(state, action) {
        switch (action.type) {
            case ApiDocActionType.SELECT_CATEGORY:
                return action.id;
        }
    }

};

export default new CategoryStore();

