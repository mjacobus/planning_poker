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
    adminUuid: payload.adminUuid,
    votingUuid: payload.votingUuid
  };
}

export function getRoomStart() {
  return {
    type: constants.GET_ROOM_START
  };
}

export function getRoomFailure() {
  return {
    type: constants.GET_ROOM_FAILURE
  };
}

export function getRoomSuccess(payload) {
  return {
    type: constants.GET_ROOM_SUCCESS,
    name: payload.name,
    description: payload.description,
    stories: payload.stories,
    adminUuid: payload.adminUuid,
    votingUuid: payload.votingUuid
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
      const responseData = response.estimation_room;

      dispatch(createRoomSuccess({
        adminUuid: responseData.admin_uuid,
        votingUuid: responseData.voting_uuid
      }));
      browserHistory.push(`/room/${responseData.admin_uuid}/admin`);
    })
    .catch((error) => {
      console.log('error', error);
      dispatch(createRoomFailure());
    });
  };
}

export function getRoom(adminUuid) {
  return function(dispatch) {
    dispatch(getRoomStart());

    return fetch(`/api/estimation_rooms/${adminUuid}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    })
    .then(checkStatus)
    .then((response) => response.json())
    .then((response) => {
      const responseData = response.estimation_room;

      dispatch(getRoomSuccess({
        name: responseData.name,
        description: responseData.description,
        stories: responseData.stories,
        adminUuid: responseData.admin_uuid,
        votingUuid: responseData.voting_uuid
      }));
    })
    .catch((error) => {
      console.log('error', error);
      dispatch(getRoomFailure());
    });
  };
}
