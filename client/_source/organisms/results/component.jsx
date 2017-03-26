import React, { PropTypes, Component } from 'react';
import Card from '../../molecules/card';
import './index.scss';

export default class Results extends Component {
  getResults(results) {
    const resultsMarkup = [];
    let index = 0;

    for (const i in results) {
      if (results.hasOwnProperty(i)) {
        resultsMarkup.push(<Card key={ index } estimation={ parseInt(i, 10) } users={ results[i].users } onButtonClick={ this.props.onButtonClick } />);
        index++;
      }
    }

    return resultsMarkup;
  }

  render() {
    const { users } = this.props;
    const results = {};
    let i = users.length;

    while (i--) {
      const user = users[i];

      results[user.estimation] = results[user.estimation] ? results[user.estimation] : {};

      const result = results[user.estimation];

      result.users = result.users || [];
      result.users.push(user.name);
    }

    return (
      <ul className="results">
        { this.getResults(results) }
      </ul>
    );
  }
}

Results.propTypes = {
  users: PropTypes.array.isRequired,
  onButtonClick: PropTypes.func.isRequired
};
