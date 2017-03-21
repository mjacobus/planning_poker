import React, { Component, PropTypes } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Label from '../../atoms/label';
import Input from '../../atoms/input';
import Button from '../../atoms/button';
import Page from '../../templates/page';
import './index.scss';

export default class Room extends Component {
  render() {
    // check for uuid
    
    return (
      this.props.adminUuid && this.props.votingUuid ? (
        <Page className="room">
          <Heading text={ this.props.name } />
          <Subheading text={ this.props.description } />
        </Page>
      ) : (
        <div>
          <Page className="room">
            <Heading text="This is not the room you are looking for" />
            <Subheading text="Copied a wrong link?" />
          </Page>
        </div>
      ));
  }
}

Room.propTypes = {
  name: PropTypes.string,
  description: PropTypes.string,
  adminUuid: PropTypes.string,
  votingUuid: PropTypes.string
};

Room.defaultProps = {
  name: '',
  description: '',
  adminUuid: '',
  votingUuid: ''
};
