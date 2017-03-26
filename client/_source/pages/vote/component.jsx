import React, { Component, PropTypes } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Page from '../../templates/page';
import Results from '../../organisms/results';
import CardEdge from '../../molecules/card-edge';
import Spinner from '../../atoms/spinner';
import Button from '../../atoms/button';
import Modal from '../../organisms/modal';
import './index.scss';

export default class Vote extends Component {
  constructor(props) {
    super(props);

    this.showSpinner = true;
    this.timer = null;
    this.estimation = null;
    this.toggleRestartModal = this.toggleRestartModal.bind(this);
    this.toggleSelectModal = this.toggleSelectModal.bind(this);
    this.onRestartModalSave = this.onRestartModalSave.bind(this);
    this.onSelectModalSave = this.onSelectModalSave.bind(this);
    this.state = {
      selectModalOpen: false,
      restartModalOpen: false
    };
  }

  componentDidMount() {
    this.fetchRoomLoop();
  }

  componentWillUnmount() {
    window.clearTimeout(this.timer);
  }

  // don't update when no changes

  toggleRestartModal() {
    this.setState({
      restartModalOpen: !this.state.restartModalOpen
    });
  }

  toggleSelectModal(estimation) {
    this.estimation = typeof estimation === 'number' ? estimation : null;

    this.setState({
      selectModalOpen: !this.state.selectModalOpen
    });
  }

  onRestartModalSave() {

  }

  onSelectModalSave() {
    
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
    const restartText = 'Yes, I’m Sure. Please restart the voting';
    const selectText = 'Save the result and back to list overview';
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
                  <CardEdge users={ edges.upper.users } estimation={ edges.upper.estimation } edge="upper" onButtonClick={ this.toggleSelectModal } />
                  <CardEdge users={ edges.lower.users } estimation={ edges.lower.estimation } edge="lower" onButtonClick={ this.toggleSelectModal } />
                </div>
                <hr className="vote__hr vote__hr--completed" />
                <Results users={ users } onButtonClick={ this.toggleSelectModal } />
                <hr className="vote__hr vote__hr--completed" />
                <Button text="Restart voting" className="vote__restart" rank={ 2 } onClick={ this.toggleRestartModal } />
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
        <Modal open={ this.state.restartModalOpen } text={ restartText } onClose={ this.toggleRestartModal } onSave={ this.onRestartModalSave }>
          <Heading className="vote__restart-message" text="All results will be delete if you restart the voting now." />
          <Heading className="vote__restart-message" text="Are you sure to restart the voting?" />
        </Modal>
        <Modal open={ this.state.selectModalOpen } text={ selectText } onClose={ this.toggleSelectModal } onSave={ this.onSelectModalSave }>
          <div className="vote__header">
            <div className="vote__estimation">{ this.estimation }</div>
            <div>
              <Heading className="vote__name" text={ name } />
              <Subheading className="vote__description" text={ description } />
            </div>
          </div>
        </Modal>
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
