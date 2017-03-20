import { connect } from 'react-redux';
import Component from './component.jsx';
import { actions } from '../../_state/room';

export const mapStateToProps = function(state) {
  return {
    name: state.room.name
  };
};

export const mapDispatchToProps = function(dispatch) {
  return {
    setRoomName: () => {
      dispatch(actions.setRoomName());
    }
  };
};


const Container = connect(
  mapStateToProps,
  mapDispatchToProps
)(Component);

export default Container;
