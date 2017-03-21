import React, { Component, PropTypes } from 'react';
import './index.scss';

export default class Label extends Component {
  render() {
    return (
      <label className="label">
        { this.props.text }
      </label>
    );
  }
}

Label.propTypes = {
  text: PropTypes.string
};
