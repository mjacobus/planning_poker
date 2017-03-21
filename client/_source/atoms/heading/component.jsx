import React, { Component, PropTypes } from 'react';
import './index.scss';

export default class Heading extends Component {
  render() {
    return (
      <h1 className="heading">
        { this.props.text }
      </h1>
    );
  }
}

Heading.propTypes = {
  text: PropTypes.string
};
