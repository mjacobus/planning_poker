import React, { Component, PropTypes } from 'react';
import './index.scss';

export default class Page extends Component {
  render() {
    return (
      <div className={ ['page', this.props.className].join(' ') }>
        { this.props.children }
      </div>
    );
  }
}

Page.propTypes = {
  children: PropTypes.oneOfType([
    PropTypes.array,
    PropTypes.element,
    PropTypes.string
  ]),
  className: PropTypes.string
};
