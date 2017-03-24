import React, { Component, PropTypes } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Page from '../../templates/page';
import Results from '../../organisms/results';
import CardEdge from '../../molecules/card-edge';
import './index.scss';

export default class Vote extends Component {
  constructor(props) {
    super(props);

    this.timer = null;
  }

  componentDidMount() {
    this.fetchRoomLoop();
  }

  componentWillUnmount() {
    window.clearTimeout(this.timer);
  }

  fetchRoomLoop() {
    this.props.getRoom(this.props.params.id);

    this.timer = window.setTimeout(() => {
      this.fetchRoomLoop();
    }, 2000);
  }

  render() {
    const { name, description, roomName } = this.props;
    let usersFinishedCount = 0;

    // for testing
    const users = [{
      name: 'Marcelo',
      estimation: 1,
      status: 'finished'
    }, {
      name: 'Nico',
      estimation: 1,
      status: 'in_progress'
    }, {
      name: 'Oliver',
      estimation: 8,
      status: 'finished'
    }];

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
          <div>
            <CardEdge users={ ['aas'] } estimation={ '8' } edge="upper" />
            <CardEdge users={ ['aas', 'asas'] } estimation={ '1' } edge="lower" />
            <hr className="vote__hr" />
            <Results users={ users } />
          </div>
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
  users: PropTypes.array.isRequired,
  getRoom: PropTypes.func.isRequired,
  params: PropTypes.object.isRequired,
  addName: PropTypes.func.isRequired,
  addDescription: PropTypes.func.isRequired
};
