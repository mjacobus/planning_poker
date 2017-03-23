import React, { Component, PropTypes } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Page from '../../templates/page';
import Results from '../../organisms/results';
import './index.scss';

export default class Vote extends Component {
  componentDidMount() {
    // check status every X seconds
  }

  render() {
    const { name, description, roomName } = this.props;

    // for testing
    const users = [{
      name: 'Marcelo',
      estimation: 1,
      status: 'finished'
    }, {
      name: 'Nico',
      estimation: 1,
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
    const votesCompleted = usersFinishedCount === users.length;

    return (
      <Page className="vote">
        <div className="vote__room">{ roomName }</div>
        <Heading text={ name } />
        <Subheading className="vote__subheading" text={ description } />
        {votesCompleted ? (
          <Results users={ users } />
        ) : (
          <div>
            <hr className="vote__hr" />
            <Heading className="vote__vote-now" text="Please vote now!" />
            <div>{ votes }</div>
            <ul className="vote__users">
              {users.map((user, index) => <Heading text={ user.name } key={ index } className={ `vote__user vote__user--${user.status}` } />)}
            </ul>
          </div>
        )}
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
