import React, { PropTypes, Component } from 'react';
import './frame.scss';

export default class Frame extends Component {
  render() {
    return (
      <div>
        { this.props.children }
      </div>
    );
  }
}

Frame.propTypes = {
  'children': PropTypes.element
};
