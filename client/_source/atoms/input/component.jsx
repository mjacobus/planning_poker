import React, { Component, PropTypes } from 'react';
import './index.scss';

export default class Input extends Component {
  render() {
    const props = {
      readOnly: this.props.readOnly,
      className: 'input',
      required: this.props.required,
      type: this.props.type,
      value: this.props.value,
      onChange: this.props.onChange
    };

    return (
      <input { ...props } />
    );
  }
}

Input.propTypes = {
  type: PropTypes.string.isRequired,
  value: PropTypes.string.isRequired,
  required: PropTypes.bool,
  onChange: PropTypes.func,
  readOnly: PropTypes.bool
};
