import * as constants from './constants';
import 'whatwg-fetch';
import { browserHistory } from 'react-router';

export function createStoryStart() {
  return {
    type: constants.CREATE_STORY_START
  };
}

export function createStoryFailure() {
  return {
    type: constants.CREATE_STORY_FAILURE
  };
}

export function createStorySuccess(payload) {
  return {
    type: constants.CREATE_STORY_SUCCESS,
    name: payload.name,
    description: payload.description
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

export function createStory(data) {
  return function(dispatch) {
    dispatch(createStoryStart());

    return fetch(`/api/estimation_rooms/${data.adminUuid}/stories`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        'estimation_story': {
          description: data.description,
          name: data.name
        }
      })
    })
    .then(checkStatus)
    .then((response) => response.json())
    .then(() => {
      dispatch(createStorySuccess({
        description: data.description,
        name: data.name
      }));
      browserHistory.push(`/room/${data.adminUuid}/admin/vote`);
    })
    .catch((error) => {
      console.log('error', error);
      dispatch(createStoryFailure());
    });
  };
}
