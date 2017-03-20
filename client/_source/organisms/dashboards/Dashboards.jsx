import React, { PropTypes, Component } from 'react';
import { scrolling } from '../../00_base/utils/Scrolling';

import Dashboard from '../../02_molecules/dashboard/Dashboard.jsx';
import Button from '../../01_atoms/button/Button.jsx';

/**
 * React component
 * 
 * @class Dashboards
 * @classdesc 03_organisms/dashboards/Dashboards
 *
 * @requires 01_atoms/button/Button
 * @requires 02_molecules/dashboard/Dashboard
 *
 * @prop {array}    dashboards       Array of all dashboards
 * @prop {boolean}  editMode         Edit mode enabled/disabled
 * @prop {boolean}  headerSticky     Sticky header enabled/disabled
 * @prop {boolean}  toolbarSticky    Sticky toolbar enabled/disabled
 * @prop {function} onDashboardClick Dashboard click callback
 * @prop {function} updateOffset     Update the top offset dispatcher
 * @prop {number}   activeDashboard  The active dashboard
 * @prop {number}   activePosition   0 for sidebar, 1 for dropdown
 * @prop {number}   offset           Top offset (padding)
 * @prop {number}   position         0 for sidebar, 1 for dropdown
 */
export default class Dashboards extends Component {
    componentDidMount() {
        // Sidebar
        if (this.props.position === 1 && this.props.activePosition === 1) {
            scrolling.registerAction('dashboards0', {
                'offset': 152,
                'scope': this,
                'isAbove': function() {
                    if (!this.props.toolbarSticky && !this.props.headerSticky) {
                        this.props.updateOffset(3);
                    }
                },
                'isBelow': function() {
                    if (!this.props.toolbarSticky && !this.props.headerSticky) {
                        this.props.updateOffset(0);
                    }
                }
            });

            scrolling.registerAction('dashboards1', {
                'offset': 85,
                'scope': this,
                'isAbove': function() {
                    if (this.props.toolbarSticky && !this.props.headerSticky) {
                        this.props.updateOffset(3);
                    }
                },
                'isBelow': function() {
                    if (this.props.toolbarSticky && !this.props.headerSticky) {
                        this.props.updateOffset(1);
                    }
                }
            });

            scrolling.registerAction('dashboards2', {
                'offset': 68,
                'scope': this,
                'isAbove': function() {
                    if (!this.props.toolbarSticky && this.props.headerSticky) {
                        this.props.updateOffset(3);
                    }
                },
                'isBelow': function() {
                    if (!this.props.toolbarSticky && this.props.headerSticky) {
                        this.props.updateOffset(2);
                    }
                }
            });
        }
    }

    componentDidUpdate() {
        // Sidebar
        if (this.props.position === 1 && this.props.activePosition === 1) {
            scrolling.updateStatus('dashboards0');
            scrolling.updateStatus('dashboards1');
            scrolling.updateStatus('dashboards2');
        }
    }

    componentWillUnmount() {
        // Sidebar
        if (this.props.position === 1 && this.props.activePosition === 1) {
            scrolling.removeAction('dashboards0');
            scrolling.removeAction('dashboards1');
            scrolling.removeAction('dashboards2');
        }
    }

    getClassName() {
        const PROPS = this.props,
            SIDEBAR_OPEN_CLASS = PROPS.sidebarOpen ? ' o-dashboards--sidebar-open' : '';
        let className = 'o-dashboards ';

        if (PROPS.position === 1) {
            className += 'o-dashboards--sidebar ';
        } else {
            className += 'o-dashboards--dropdown ';
        }

        if (PROPS.position === 1 && PROPS.activePosition === 1) {
            className += 'o-dashboards--sidebar-active o-dashboards--sidebar-fixed' + this.props.offset;
        } else if (PROPS.position === 0 && PROPS.activePosition === 0) {
            className += 'o-dashboards--dropdown-active';
        }

        className += SIDEBAR_OPEN_CLASS;

        return className;
    }

    render() {
        const PROPS = this.props;
        const DASHBOARDS = PROPS.dashboards;
        const CLASS = this.getClassName();

        return (
            <aside className={ CLASS }>
                <ul className="o-dashboards__list">
                    <li className="o-dashboards__title">{ 'Dashboards' }</li>
                    {DASHBOARDS.map((dashboard) =>
                        <Dashboard 
                            key={ dashboard.id } { ...dashboard } 
                            onDashboardClick={ PROPS.onDashboardClick } 
                            isActive={ this.props.activeDashboard === dashboard.id } 
                            editMode={ PROPS.editMode }
                        />
                    )}
                    <li className="o-dashboards__button-wrapper">
                        <Button text="Add" buzzword="dashboard" className="o-dashboards__button" />
                    </li>
                </ul>
            </aside>
        );
    }
}

Dashboards.propTypes = {
    'position': PropTypes.number.isRequired,
    'activePosition': PropTypes.number.isRequired,
    'dashboards': PropTypes.array.isRequired,
    'onDashboardClick': PropTypes.func.isRequired,
    'updateOffset': PropTypes.func.isRequired,
    'activeDashboard': PropTypes.number.isRequired,
    'editMode': PropTypes.bool.isRequired,
    'headerSticky': PropTypes.bool.isRequired,
    'toolbarSticky': PropTypes.bool.isRequired,
    'offset': PropTypes.number.isRequired
};
