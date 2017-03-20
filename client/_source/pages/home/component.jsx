import React, { Component, PropTypes } from 'react';

export default class Home extends Component {
  constructor(props) {
    super(props);

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(event) {
    //console.log(this.props.name);
    event.preventDefault();
  }

  handleChange(e) {
    this.props.setRoomName(e.target.value);
  }

  render() {
    //console.log(this.props.name);

    return (
      <form onSubmit={ this.handleSubmit }>
        <label>{ 'Room name:' }</label>
        <input type="text" value={ this.props.name } onChange={ this.handleChange } />
        <input type="submit" value="Submit" />
      </form>
    );
  }
}

Home.propTypes = {
  name: PropTypes.string.isRequired,
  setRoomName: PropTypes.func.isRequired
};
