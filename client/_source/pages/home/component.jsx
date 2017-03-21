import React, { Component, PropTypes } from 'react';

export default class Home extends Component {
  constructor(props) {
    super(props);

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleNameChange = this.handleNameChange.bind(this);
    this.handleDescChange = this.handleDescChange.bind(this);
  }

  handleSubmit(event) {
    this.props.createRoom({
      name: this.props.name,
      description: this.props.description
    });
    
    event.preventDefault();
  }

  handleNameChange(event) {
    this.props.setRoomName(event.target.value);
  }

  handleDescChange(event) {
    this.props.setRoomDesc(event.target.value);
  }

  render() {
    return (
      <form onSubmit={ this.handleSubmit }>
        <label>{ 'Room name:' }</label>
        <input required type="text" value={ this.props.name } onChange={ this.handleNameChange } />
        <input required type="text" value={ this.props.description } onChange={ this.handleDescChange } />
        <input type="submit" value="Submit" />
      </form>
    );
  }
}

Home.propTypes = {
  name: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  setRoomName: PropTypes.func.isRequired,
  setRoomDesc: PropTypes.func.isRequired,
  createRoom: PropTypes.func.isRequired
};
