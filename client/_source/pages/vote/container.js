import { connect } from 'react-redux';
import Component from './component.jsx';
import { actions } from '../../_state/room';

export const mapStateToProps = function(state) {
  return {
    roomName: state.room.name,
    name: state.vote.name,
    description: state.vote.description,
    users: state.vote.users
  };
};

export const mapDispatchToProps = function(dispatch) {
  return {
    
  };
};

const Container = connect(
  mapStateToProps,
  mapDispatchToProps
)(Component);

export default Container;
