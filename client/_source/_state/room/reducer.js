import * as constants from './constants';

const reducer = (state = {}, action) => {
  switch (action.type) {
    case constants.SET_ROOM_NAME:
      return Object.assign({}, state, {
        name: action.value
      });

    case constants.SET_ROOM_DESC:
      return Object.assign({}, state, {
        description: action.value
      });

    case constants.CREATE_ROOM_START:
      return Object.assign({}, state, {
        pending: true
      });

    case constants.CREATE_ROOM_SUCCESS:
      return Object.assign({}, state, {
        pending: false,
        adminUuid: action.adminUuid,
        votingUuid: action.votingUuid
      });

    case constants.CREATE_ROOM_FAILURE:
      return Object.assign({}, state, {
        pending: false
      });

    default:
      return state;
  }
};

export default reducer;
