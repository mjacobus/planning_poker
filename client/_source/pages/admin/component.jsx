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
      isOpen: false
    };

    this.onAddStoryClick = this.onAddStoryClick.bind(this);
  }

  onAddStoryClick() {
    this.setState({
      isOpen: true
    });
  }

  render() {
    const { adminUuid, votingUuid, name, description } = this.props;
    const adminUrl = `${window.location.origin}/room/${this.props.adminUuid}/admin`;
    const votingUrl = `${window.location.origin}/room/${this.props.votingUuid}`;

    return (
      adminUuid && votingUuid ? (
        <div>
          <div className="links">
            <div className="links__content">
              <Label text="Share the room link" />
              <Input type="text" value={ adminUrl } />
              <Label text="Share the voting link" />
              <Input required type="text" value={ votingUrl } />
            </div>
          </div>
          <Page className="admin">
            <Heading text={ name } />
            <Subheading text={ description } />
            {<div>
              <Button text="Add a new story" onClick={ this.onAddStoryClick } />
            </div>}
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
  votingUuid: PropTypes.string
};
