import React, { PropTypes, Component } from 'react';
import Button from '../../atoms/button';
import './index.scss';

export default class Card extends Component {
  constructor(props) {
    super(props);

    this.onButtonClick = this.onButtonClick.bind(this);
  }

  onButtonClick() {
    this.props.onButtonClick(this.props.estimation);
  }

  render() {
    const { users, estimation } = this.props;

    return (
      <li className="card">
        <div className="card__estimation">{ estimation }</div>
        <div>{ `( ${users.length} Votes )` }</div>
        <ul className="card__users">
          {users.join(', ')}
        </ul>
        <Button text="Select as final size" className="card__button" onClick={ this.onButtonClick } />
      </li>
    );
  }
}

Card.propTypes = {
  users: PropTypes.array.isRequired,
  estimation: PropTypes.number.isRequired,
  onButtonClick: PropTypes.func.isRequired
};
