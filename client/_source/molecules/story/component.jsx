import React, { PropTypes, Component } from 'react';
import Heading from '../../atoms/heading';
import Subheading from '../../atoms/subheading';
import Button from '../../atoms/button';
import './index.scss';

export default class Story extends Component {
  render() {
    const { name, description, estimation } = this.props;

    return (
      <div className="story">
        <div className="story__header">
          <div className="story__estimation">{ estimation }</div>
          <div>
            <Heading className="story__name" text={ name } />
            <Subheading className="story__description" text={ description } />
          </div>
        </div>
        <hr className="story__hr" />
        <Button text="Delete" rank={ 2 } className="story__delete" />
        <Button text="Edit" rank={ 2 } className="story__edit" />
      </div>
    );
  }
}

Story.propTypes = {
  name: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  estimation: PropTypes.number.isRequired
};
