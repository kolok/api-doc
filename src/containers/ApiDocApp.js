'use strict';

import ApiDocView from '../views/ApiDocView';
import {Container} from 'flux/utils';
import CategoryStore from '../data/CategoryStore';

function getStores() {
    return [
        CategoryStore,
        ];
}

function getState() {
    return {
        category: CategoryStore.getState(),
    };
}

export default Container.createFunctional(ApiDocView, getStores, getState);

