import React, { PropTypes, Component } from 'react';
import './index.scss';

export default class Spinner extends Component {
  render() {
    return (
      <div className={ ['spinner', this.props.className].join(' ') } />
    );
  }
}

Spinner.propTypes = {
  className: PropTypes.string
};

Spinner.defaultProps = {
  className: ''
};
