import * as constants from './constants';
import 'whatwg-fetch';

export function setRoomName(value) {
  return {
    type: constants.SET_ROOM_NAME,
    value
  };
}
