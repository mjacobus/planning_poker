import React, { Component, PropTypes } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Label from '../../atoms/label';
import Input from '../../atoms/input';
import Button from '../../atoms/button';
import Page from '../../templates/page';
import './index.scss';

export default class Home extends Component {
  constructor(props) {
    super(props);

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleNameChange = this.handleNameChange.bind(this);
    this.handleDescChange = this.handleDescChange.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();

    this.props.createRoom({
      name: this.props.name,
      description: this.props.description
    });
  }

  handleNameChange(event) {
    this.props.setRoomName(event.target.value);
  }

  handleDescChange(event) {
    this.props.setRoomDesc(event.target.value);
  }

  render() {
    const { name, description, pending } = this.props;

    return (
      <Page className="home">
        <Heading text="Welcome to smart planning poker" />
        <Subheading text="Create a room, share it with your team and start your planning poker" />
        <form className="form" onSubmit={ this.handleSubmit }>
          <Label text="Room Name" />
          <Input required type="text" value={ name } onChange={ this.handleNameChange } />
          <Label text="Description and notes" />
          <Input required type="text" value={ description } onChange={ this.handleDescChange } />
          <Button type="submit" text="Create a new room" pending={ pending } />
        </form>
      </Page>
    );
  }
}

Home.propTypes = {
  name: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  setRoomName: PropTypes.func.isRequired,
  setRoomDesc: PropTypes.func.isRequired,
  createRoom: PropTypes.func.isRequired,
  pending: PropTypes.bool.isRequired
};
