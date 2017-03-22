import React, { PropTypes, Component } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import './index.scss';

export default class Story extends Component {
  render() {
    const { name, description, finalEstimation } = this.props;

    return (
      <div className="story">
        <div className="story__estimation">{ finalEstimation }</div>
        <div>
          <Heading className="story__name" text={ name } />
          <Subheading className="story__description" text={ description } />
        </div>
        <hr className="story__hr" />
      </div>
    );
  }
}

Story.propTypes = {
  name: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  finalEstimation: PropTypes.number.isRequired
};
