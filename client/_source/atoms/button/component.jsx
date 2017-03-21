import React, { PropTypes, Component } from 'react';
import './index.scss';

export default class Button extends Component {
  render() {
    return (
      <button type={ this.props.type } className={ ['button', this.props.className].join(' ') } onClick={ this.props.onClick }>
        { this.props.text }
      </button>
    );
  }
}

Button.propTypes = {
  className: PropTypes.string,
  text: PropTypes.string,
  type: PropTypes.string,
  onClick: PropTypes.func
};

Button.defaultProps = {
  className: '',
  text: '',
  type: 'text'
};
