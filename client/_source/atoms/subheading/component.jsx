import React, { Component, PropTypes } from 'react';
import './index.scss';

export default class Subheading extends Component {
  render() {
    return (
      <h2 className="subheading">
        { this.props.text }
      </h2>
    );
  }
}

Subheading.propTypes = {
  text: PropTypes.string
};
