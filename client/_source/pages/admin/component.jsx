import React, { Component, PropTypes } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Label from '../../atoms/label';
import Input from '../../atoms/input';
import Button from '../../atoms/button';
import Page from '../../templates/page';
import Story from '../../molecules/story';
import './index.scss';

export default class Admin extends Component {
  constructor(props) {
    super(props);

    this.state = {
      isOpen: false,
      storyName: '',
      storyDesc: '',
      adminUuid: this.props.params.id
    };

    this.showSpinner = true;
    this.timer = null;
    this.onAddStoryClick = this.onAddStoryClick.bind(this);
    this.onCloseClick = this.onCloseClick.bind(this);
    this.handleNameChange = this.handleNameChange.bind(this);
    this.handleDescChange = this.handleDescChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
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

  onAddStoryClick() {
    this.setState({
      isOpen: true
    });
  }

  onCloseClick() {
    this.setState({
      isOpen: false
    });
  }

  handleSubmit(event) {
    event.preventDefault();

    this.props.createStory({
      adminUuid: this.state.adminUuid,
      description: this.state.storyDesc,
      name: this.state.storyName
    });
  }

  handleNameChange(event) {
    this.setState({
      storyName: event.target.value
    });
  }

  handleDescChange(event) {
    this.setState({
      storyDesc: event.target.value
    });
  }

  render() {
    const { name, description, votingUuid, stories, pending, storyPending } = this.props;
    const adminUuid = this.props.adminUuid || this.state.adminUuid;
    const adminUrl = `${window.location.origin}/room/${this.props.adminUuid}/admin`;
    const votingUrl = `${window.location.origin}/room/${this.props.votingUuid}`;
    const isOpen = this.state.isOpen;
    let showSpinner = false;

    if (pending && this.showSpinner) {
      this.showSpinner = false;
      showSpinner = true;
    }

    return (
      <div>
        {showSpinner && (
          <div>{'pending'}</div>
        )}
        {!showSpinner && adminUuid && votingUuid && (
          <div>
            <div className="links">
              <div className="links__content">
                <Label text="Share the room link" />
                <Input type="text" value={ adminUrl } />
                <Label text="Share the voting link" />
                <Input type="text" value={ votingUrl } />
              </div>
            </div>
            <Page className="admin">
              <Heading text={ name } />
              <Subheading text={ description } />
              {isOpen ? (
                <form className="admin__create" onSubmit={ this.handleSubmit }>
                  <Label text="Your story name" />
                  <Input required type="text" value={ this.state.storyName } onChange={ this.handleNameChange } />
                  <Label text="Description and notes" />
                  <Input type="text" value={ this.state.storyDesc } onChange={ this.handleDescChange } />
                  <Button type="submit" className="admin__start" text="Start planning round" pending={ storyPending } />
                  <Button text="Close" rank={ 2 } onClick={ this.onCloseClick } />
                </form>
              ) : <Button className="admin__add" text="Add a new story" onClick={ this.onAddStoryClick } />}
              {stories.map((props, index) => <Story key={ index } { ...props } />)}
            </Page>
          </div>
        )}
        {!showSpinner && (!adminUuid || !votingUuid) && (
          <Page className="admin">
            <Heading text="This is not the room you are looking for" />
            <Subheading text="Copied a wrong link?" />
          </Page>
        )}
      </div>
    );
  }
}

Admin.propTypes = {
  name: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  adminUuid: PropTypes.string.isRequired,
  votingUuid: PropTypes.string.isRequired,
  createStory: PropTypes.func.isRequired,
  getRoom: PropTypes.func.isRequired,
  params: PropTypes.object.isRequired,
  stories: PropTypes.array.isRequired,
  pending: PropTypes.bool.isRequired,
  storyPending: PropTypes.bool.isRequired
};
