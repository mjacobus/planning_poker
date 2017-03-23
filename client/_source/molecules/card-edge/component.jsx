import React, { PropTypes, Component } from 'react';
import Button from '../../atoms/button';
import './index.scss';

export default class CardEdge extends Component {
  render() {
    const { users, estimation, edge } = this.props;

    return (
      <li className={ ['card-edge', `card-edge--${edge}`].join(' ') }>
        <div className="card-edge__estimation">{ estimation }</div>
        <div className="card-edge__label">{ 'vote' }</div>
        <Button text="Select as final size" rank={ 2 } className="card-edge__button" onClick={ this.onButtonClick } />
        <ul className="card-edge__users">
          {users.join(', ')}
        </ul>
      </li>
    );
  }
}

CardEdge.propTypes = {
  users: PropTypes.array.isRequired,
  estimation: PropTypes.string.isRequired,
  edge: PropTypes.string.isRequired
};
