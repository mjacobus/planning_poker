import * as constants from './constants';
import 'whatwg-fetch';
import { browserHistory } from 'react-router';

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

export function createRoomStart() {
  return {
    type: constants.CREATE_ROOM_START
  };
}

export function createRoomFailure() {
  return {
    type: constants.CREATE_ROOM_FAILURE
  };
}

export function createRoomSuccess(payload) {
  return {
    type: constants.CREATE_ROOM_SUCCESS,
    payload
  };
}

function checkStatus(response) {
  if (response.status >= 200 && response.status < 300) {
    return response;
  }

  const error = new Error(response.statusText);
  
  error.response = response;
  throw error;
}

export function createRoom(data) {
  return function(dispatch) {
    dispatch(createRoomStart());

    return fetch('/api/estimation_rooms', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        'estimation_room': {
          description: data.description,
          name: data.name
        }
      })
    })
    .then(checkStatus)
    .then((response) => response.json())
    .then((response) => {
      console.log('response', response);

      const responseData = response.estimation_room;

      dispatch(createRoomSuccess({
        'admin_uuid': responseData.admin_uuid,
        'voting_uuid': responseData.voting_uuid
      }));
      browserHistory.push(`/room/${responseData.admin_uuid}`);
    })
    .catch((error) => {
      console.log('error', error);
      dispatch(createRoomFailure());
    });
  };
}
