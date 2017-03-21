import * as constants from './constants';

export function setRoomName(value) {
  return {
    type: constants.SET_ROOM_NAME,
    value
  };
}

export function setRoomDesc(value) {
  return {
    type: constants.SET_ROOM_DESC,
    value
  };
}

export function createRoom(payload) {
  console.log(payload);

  return {
    type: constants.CREATE_ROOM,
    payload
  };
}
