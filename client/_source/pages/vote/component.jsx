import React, { Component, PropTypes } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Page from '../../templates/page';
import './index.scss';

export default class Vote extends Component {
  render() {
    const { name, description, roomName } = this.props;

    return (
      <Page className="vote">
        <div>{ roomName }</div>
        <Heading text={ name } />
        <Subheading text={ description } />
      </Page>
    );
  }
}

Vote.propTypes = {
  name: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  roomName: PropTypes.string.isRequired
};
