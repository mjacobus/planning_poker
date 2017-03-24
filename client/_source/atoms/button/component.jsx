import React, { PropTypes, Component } from 'react';
import Spinner from '../../atoms/spinner';
import './index.scss';

export default class Button extends Component {
  render() {
    const { rank, className, onClick, text, type, pending } = this.props;
    const rankClasses = {
      '1': 'button--primary',
      '2': 'button--secondary'
    };
    const pendingClass = pending ? 'button--pending' : '';

    return (
      <button type={ type } className={ ['button', className, pendingClass, rankClasses[rank]].join(' ') } onClick={ onClick }>
        <span className="button__text">{ text }</span>
        <Spinner className="button__busy" />
      </button>
    );
  }
}

Button.propTypes = {
  className: PropTypes.string,
  text: PropTypes.string,
  type: PropTypes.string,
  onClick: PropTypes.func,
  rank: PropTypes.number,
  pending: PropTypes.bool
};

Button.defaultProps = {
  className: '',
  text: '',
  type: 'text',
  rank: 1,
  pending: false
};
