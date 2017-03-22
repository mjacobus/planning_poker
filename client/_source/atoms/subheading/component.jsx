import React, { Component, PropTypes } from 'react';
import './index.scss';

export default class Subheading extends Component {
  render() {
    const { text, className } = this.props;

    return (
      <h2 className={ ['subheading', className].join(' ') }>
        { text }
      </h2>
    );
  }
}

Subheading.propTypes = {
  text: PropTypes.string,
  className: PropTypes.string
};
