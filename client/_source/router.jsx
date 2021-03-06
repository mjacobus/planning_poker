import React from 'react';
import { Route, IndexRoute } from 'react-router';
import Frame from './_frame';
import Home from './pages/home';
import Room from './pages/room';
import Admin from './pages/admin';
import Vote from './pages/vote';

export default (
  <Route path="/" component={ Frame }>
    <IndexRoute component={ Home } />
    <Route path="room">
      <IndexRoute component={ Home } />
      <Route path=":id" component={ Room } />
      <Route path=":id/admin" component={ Admin } />
      <Route path=":id/admin/vote" component={ Vote } />
    </Route>
    <Route path="*" component={ Home } />
  </Route>
);
