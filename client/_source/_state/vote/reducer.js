import * as constants from './constants';

const reducer = (state = {}, action) => {
  switch (action.type) {
    case constants.CREATE_STORY_START:
      return Object.assign({}, state, {
        pending: true
      });

    case constants.CREATE_STORY_FAILURE:
      return Object.assign({}, state, {
        pending: false
      });

    case constants.CREATE_STORY_SUCCESS:
      return Object.assign({}, state, {
        pending: false,
        name: action.name,
        description: action.description
      });

    default:
      return state;
  }
};

export default reducer;
