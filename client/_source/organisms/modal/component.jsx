import React, { PropTypes, Component } from 'react';
import Button from '../../atoms/button';
import './index.scss';

export default class Modal extends Component {
  constructor(props) {
    super(props);

    this.onModalClick = this.onModalClick.bind(this);
    this.onOverlayClick = this.onOverlayClick.bind(this);
  }

  onOverlayClick() {
    this.props.onClose();
  }

  onModalClick(event) {
    event.stopPropagation();
  }

  render() {
    const { children, onClose, onSave, open, text } = this.props;
    const overlayOpenClass = open ? 'overlay--open' : '';
    const modalOpenClass = open ? 'modal--open' : '';

    return (
      <div className={ ['overlay', overlayOpenClass].join(' ') } onClick={ this.onOverlayClick }>
        <div className={ ['modal', modalOpenClass].join(' ') } onClick={ this.onModalClick }>
          <div className="modal__header">
            { children }
          </div>
          <hr className="modal__hr" />
          <div className="modal__buttons">
            <Button text="Cancel" className="modal__cancel" rank={ 2 } onClick={ onClose } />
            <Button text={ text } className="modal__save" onClick={ onSave } />
          </div>
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
  onSave: PropTypes.func.isRequired,
  onClose: PropTypes.func.isRequired,
  open: PropTypes.bool,
  text: PropTypes.string.isRequired
};
