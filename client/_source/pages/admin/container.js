import { connect } from 'react-redux';
import Component from './component.jsx';
import { actions } from '../../_state/room';

export const mapStateToProps = function(state) {
  return {
    name: state.room.name,
    description: state.room.description,
    adminUuid: state.room.adminUuid,
    votingUuid: state.room.votingUuid,
    stories: state.room.stories
  };
};

export const mapDispatchToProps = function(dispatch) {
  return {
    createStory: (data) => {
      dispatch(actions.createStory(data));
    }
  };
};


const Container = connect(
  mapStateToProps,
  mapDispatchToProps
)(Component);

export default Container;
