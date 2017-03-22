import React, { Component, PropTypes } from 'react';
import './index.scss';

export default class Heading extends Component {
  render() {
    const { text, className } = this.props;

    return (
      <h1 className={ ['heading', className].join(' ') }>
        { text }
      </h1>
    );
  }
}

Heading.propTypes = {
  text: PropTypes.string,
  className: PropTypes.string
};
