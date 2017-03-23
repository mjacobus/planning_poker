import React, { PropTypes, Component } from 'react';
import Card from '../../molecules/card';
import './index.scss';

export default class Results extends Component {
  getResults(results) {
    const resultsMarkup = [];

    for (const i in results) {
      if (results.hasOwnProperty(i)) {
        resultsMarkup.push(<Card estimation={ i } users={ results[i].users } />);
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
  users: PropTypes.array.isRequired
};
