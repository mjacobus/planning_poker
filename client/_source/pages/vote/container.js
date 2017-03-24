import { connect } from 'react-redux';
import Component from './component.jsx';
import { actions as room } from '../../_state/room';
import { actions as vote } from '../../_state/vote';

export const mapStateToProps = function(state) {
  const lastStory = state.room.stories[state.room.stories.length - 1];

  return {
    roomName: state.room.name,
    name: state.vote.name || (lastStory ? lastStory.name : ''),
    description: state.vote.description || (lastStory ? lastStory.description : ''),
    users: state.vote.users
  };
};

export const mapDispatchToProps = function(dispatch) {
  return {
    getRoom: (data) => {
      dispatch(room.getRoom(data));
    },
    addName: (data) => {
      dispatch(vote.addName(data));
    },
    addDescription: (data) => {
      dispatch(vote.addDescription(data));
    }
  };
};

const Container = connect(
  mapStateToProps,
  mapDispatchToProps
)(Component);

export default Container;
