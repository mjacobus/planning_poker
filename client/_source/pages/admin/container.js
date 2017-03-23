import { connect } from 'react-redux';
import Component from './component.jsx';
import { actions as room } from '../../_state/room';
import { actions as vote } from '../../_state/vote';

export const mapStateToProps = function(state) {
  return {
    name: state.room.name,
    description: state.room.description,
    adminUuid: state.room.adminUuid,
    votingUuid: state.room.votingUuid,
    stories: state.room.stories,
    pending: state.room.pending,
    storyPending: state.vote.pending
  };
};

export const mapDispatchToProps = function(dispatch) {
  return {
    createStory: (data) => {
      dispatch(vote.createStory(data));
    },
    getRoom: (data) => {
      dispatch(room.getRoom(data));
    }
  };
};

const Container = connect(
  mapStateToProps,
  mapDispatchToProps
)(Component);

export default Container;
