import React, { Component, PropTypes } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Page from '../../templates/page';
import Results from '../../organisms/results';
import CardEdge from '../../molecules/card-edge';
import Spinner from '../../atoms/spinner';
import Button from '../../atoms/button';
import './index.scss';

export default class Vote extends Component {
  constructor(props) {
    super(props);

    this.showSpinner = true;
    this.timer = null;
    this.onRestartClick = this.onRestartClick.bind(this);
  }

  componentDidMount() {
    this.fetchRoomLoop();
  }

  componentWillUnmount() {
    window.clearTimeout(this.timer);
  }

  // don't update when no changes

  onRestartClick() {
    // restart voting
  }

  fetchRoomLoop() {
    this.props.getRoom(this.props.params.id);

    this.timer = window.setTimeout(() => {
      this.fetchRoomLoop();
    }, 2000);
  }

  getEdges(users) {
    let i = users.length;
    const upper = {
        estimation: 0,
        users: []
      },
      lower = {
        estimation: 999,
        users: []
      };

    while (i--) {
      const estimation = users[i].estimation;

      if (estimation > upper.estimation) {
        upper.estimation = estimation;
        upper.users.push(users[i].name);
      }

      if (estimation < lower.estimation) {
        lower.estimation = estimation;
        lower.users.push(users[i].name);
      }
    }

    return {
      lower: lower,
      upper: upper
    };
  }

  render() {
    const { name, description, roomName, pending } = this.props;
    let usersFinishedCount = 0,
      showSpinner = false;

    if (pending && this.showSpinner) {
      this.showSpinner = false;
      showSpinner = true;
    }

    // for testing
    const users = [{
      name: 'Marcelo',
      estimation: 1,
      status: 'finished'
    }, {
      name: 'Nico',
      estimation: 2,
      status: 'finished'
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
    const edges = this.getEdges(users);

    return (
      <div>
        {showSpinner && (
          <Spinner />
        )}
        {!showSpinner && roomName && (
          <Page className="vote">
            <div className="vote__room">{ roomName }</div>
            <Heading text={ name } />
            <Subheading className="vote__subheading" text={ description } />
            {votesCompleted ? (
              <div>
                <div className="vote__cards">
                  <CardEdge users={ edges.upper.users } estimation={ edges.upper.estimation } edge="upper" />
                  <CardEdge users={ edges.lower.users } estimation={ edges.lower.estimation } edge="lower" />
                </div>
                <hr className="vote__hr vote__hr--completed" />
                <Results users={ users } />
                <hr className="vote__hr vote__hr--completed" />
                <Button text="Restart voting" className="vote__restart" rank={ 2 } onClick={ this.onRestartClick } />
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
        )}
        {!showSpinner && !roomName && (
          <Page className="admin">
            <Heading text="This is not the room you are looking for" />
            <Subheading text="Copied a wrong link?" />
          </Page>
        )}
      </div>
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
  addDescription: PropTypes.func.isRequired,
  pending: PropTypes.bool.isRequired
};
