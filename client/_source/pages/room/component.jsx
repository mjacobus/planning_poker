import React, { Component } from 'react';

export default class Room extends Component {
  render() {
    console.log(this.props.params.id);

    return (
      <div>
        {'room'}
      </div>
    );
  }
}
