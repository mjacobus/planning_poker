import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux';
import { reducer as room } from './_state/room';

const reducers = combineReducers({
  routing: routerReducer,
  room
});

export default reducers;
