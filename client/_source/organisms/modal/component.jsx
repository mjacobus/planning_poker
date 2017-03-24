import React, { PropTypes, Component } from 'react';
import Button from '../../atoms/button';
import './index.scss';

export default class Modal extends Component {
  render() {
    const { children, onCancelClick, onSaveClick, open } = this.props;
    const modalOpenClass = open ? 'modal--open' : '';
    const modalContentOpenClass = open ? 'modal__content--open' : '';

    return (
      <div className={ ['modal', modalOpenClass].join(' ') }>
        <div className={ ['modal__content', modalContentOpenClass].join(' ') }>
          <div className="modal__header">
            { children }
          </div>
          <hr className="modal__hr" />
          <Button text="Cancel" className="modal__cancel" rank={ 2 } onClick={ onCancelClick } />
          <Button text="Save the result and back to list overview" className="modal__save" onClick={ onSaveClick } />
        </div>
      </div>
    );
  }
}

Modal.propTypes = {
  children: PropTypes.oneOfType([
    PropTypes.array,
    PropTypes.element,
    PropTypes.string
  ]),
  onSaveClick: PropTypes.func.isRequired,
  onCancelClick: PropTypes.func.isRequired,
  open: PropTypes.bool
};
