import React, { PropTypes, Component } from 'react';
import Button from '../../atoms/button';
import './index.scss';

export default class CardEdge extends Component {
  constructor(props) {
    super(props);

    this.onButtonClick = this.onButtonClick.bind(this);
  }

  onButtonClick() {
    this.props.onButtonClick(this.props.estimation);
  }

  render() {
    const { users, estimation, edge } = this.props;
    const edgeText = edge === 'lower' ? 'Lowest vote' : 'Highest vote';

    return (
      <li className={ ['card-edge', `card-edge--${edge}`].join(' ') }>
        <div className="card-edge__header">
          <div className="card-edge__estimation">{ estimation }</div>
          <div className="card-edge__label"><span className="card-edge__inner-label">{ edgeText }</span></div>
          <Button text="Select as final size" rank={ 2 } className="card-edge__button" onClick={ this.onButtonClick } />
        </div>
        <ul className="card-edge__users">
          {users.join(', ')}
        </ul>
      </li>
    );
  }
}

CardEdge.propTypes = {
  users: PropTypes.array.isRequired,
  estimation: PropTypes.number.isRequired,
  edge: PropTypes.string.isRequired,
  onButtonClick: PropTypes.func.isRequired
};
