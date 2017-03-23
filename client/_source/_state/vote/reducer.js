import * as constants from './constants';

const reducer = (state = {}, action) => {
  switch (action.type) {
    case constants.SET_ROOM_NAME:
      return Object.assign({}, state, {
        name: action.value
      });

    default:
      return state;
  }
};

export default reducer;
