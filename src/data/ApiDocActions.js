'use strict';

import ApiDocActionTypes from './ApiDocActionTypes';
import ApiDocDispatcher from './ApiDocDispatcher';

const Actions = {
  selectCategory(text) {
    ApiDocDispatcher.dispatch({
      type: ApiDocActionTypes.SELECT_CATEGORY,
      id,
    });
  },
}

export default Actions;
