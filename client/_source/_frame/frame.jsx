import React, { PropTypes, Component } from 'react';
import Header from '../organisms/header';
import './frame.scss';

export default class Frame extends Component {
  render() {
    return (
      <div>
        <Header />
        { this.props.children }
      </div>
    );
  }
}

Frame.propTypes = {
  'children': PropTypes.element
};
