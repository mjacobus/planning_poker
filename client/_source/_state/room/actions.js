import * as constants from './constants';

export function setRoomName(value) {
  return {
    type: constants.SET_ROOM_NAME,
    value
  };
}
