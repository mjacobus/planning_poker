import React, { PropTypes, Component } from 'react';
import './index.scss';

export default class Button extends Component {
  render() {
    const { rank, className, onClick, text, type } = this.props;
    const rankClasses = {
      '1': 'button--primary',
      '2': 'button--secondary'
    };

    return (
      <button type={ type } className={ ['button', className, rankClasses[rank]].join(' ') } onClick={ onClick }>
        { text }
      </button>
    );
  }
}

Button.propTypes = {
  className: PropTypes.string,
  text: PropTypes.string,
  type: PropTypes.string,
  onClick: PropTypes.func,
  rank: PropTypes.number
};

Button.defaultProps = {
  className: '',
  text: '',
  type: 'text',
  rank: 1
};
