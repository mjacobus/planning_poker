import { connect } from 'react-redux';
import Component from './component.jsx';
import { actions } from '../../_state/room';

export const mapStateToProps = function(state) {
  return {
    name: state.room.name,
    description: state.room.description
  };
};

export const mapDispatchToProps = function(dispatch) {
  return {
    setRoomName: (data) => {
      dispatch(actions.setRoomName(data));
    },
    setRoomDesc: (data) => {
      dispatch(actions.setRoomDesc(data));
    },
    createRoom: (data) => {
      dispatch(actions.createRoom(data));
    }
  };
};


const Container = connect(
  mapStateToProps,
  mapDispatchToProps
)(Component);

export default Container;
