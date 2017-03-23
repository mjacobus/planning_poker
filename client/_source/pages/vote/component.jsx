import React, { Component, PropTypes } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Page from '../../templates/page';
import './index.scss';

export default class Vote extends Component {
  render() {
    const { name, description, roomName } = this.props;

    // for testing
    const users = [{
      name: 'Marcelo',
      estimation: null,
      status: 'in_progress'
    }, {
      name: 'Nico',
      estimation: 5,
      status: 'finished'
    }, {
      name: 'Oliver',
      estimation: 8,
      status: 'finished'
    }];
    let usersFinishedCount = 0;

    users.map((user) => {
      if (user.status === 'finished') {
        usersFinishedCount++;
      }
    });

    const votes = `(${usersFinishedCount} of ${users.length} votes)`;

    return (
      <Page className="vote">
        <div className="vote__room">{ roomName }</div>
        <Heading text={ name } />
        <Subheading className="vote__subheading" text={ description } />
        <Heading className="vote__vote-now" text="Please vote now!" />
        <div>{ votes }</div>
        <ul className="vote__users">
          {users.map((user, index) => <Heading text={ user.name } key={ index } className={ `vote__user vote__user--${user.status}` } />)}
        </ul>
      </Page>
    );
  }
}

Vote.propTypes = {
  name: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  roomName: PropTypes.string.isRequired,
  users: PropTypes.array.isRequired
};
