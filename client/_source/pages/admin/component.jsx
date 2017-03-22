import React, { Component, PropTypes } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Label from '../../atoms/label';
import Input from '../../atoms/input';
import Button from '../../atoms/button';
import Page from '../../templates/page';
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

    this.onAddStoryClick = this.onAddStoryClick.bind(this);
    this.onCloseClick = this.onCloseClick.bind(this);
    this.handleNameChange = this.handleNameChange.bind(this);
    this.handleDescChange = this.handleDescChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
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

    this.setState({
      isOpen: false
    });

    this.props.createStory({
      adminUuid: this.state.adminUuid
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
    let { name, description, adminUuid, votingUuid } = this.props;
    const adminUrl = `${window.location.origin}/room/${this.props.adminUuid}/admin`;
    const votingUrl = `${window.location.origin}/room/${this.props.votingUuid}`;
    const isOpen = this.state.isOpen;

    if (!adminUuid || votingUuid) {
      // get room via adminUuid
      
      // for testing
      adminUuid = true;
      votingUuid = true;
      name = 'Test name';
      description = 'Test description';
    }

    return (
      adminUuid && votingUuid ? (
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
                <Button type="submit" text="Start planning round" />
                <Button text="Close" rank={ 2 } className="admin__button" onClick={ this.onCloseClick } />
              </form>
            ) : <Button text="Add a new story" onClick={ this.onAddStoryClick } />}
          </Page>
        </div>
      ) : (
        <div>
          <Page className="admin">
            <Heading text="This is not the room you are looking for" />
            <Subheading text="Copied a wrong link?" />
          </Page>
        </div>
      ));
  }
}

Admin.propTypes = {
  name: PropTypes.string,
  description: PropTypes.string,
  adminUuid: PropTypes.string,
  votingUuid: PropTypes.string,
  createStory: PropTypes.func.isRequired,
  params: PropTypes.object.isRequired
};
