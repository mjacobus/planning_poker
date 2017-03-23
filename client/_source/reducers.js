import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux';
import { reducer as room } from './_state/room';
import { reducer as vote } from './_state/vote';

const reducers = combineReducers({
  routing: routerReducer,
  room,
  vote
});

export default reducers;
