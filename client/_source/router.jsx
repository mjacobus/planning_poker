import React from 'react';
import { Route, IndexRoute } from 'react-router';

import BookyApp from './00_base/Booky.jsx';
import Home from './05_pages/home/Home.jsx';
import About from './05_pages/about/About.jsx';
import NotFound from './05_pages/not-found/NotFound.jsx';

export default (
  <Route path="/" component={ Frame }>
    <IndexRoute component={ Home } />
    <Route path="admin" component={ Admin } />
    <Route path="*" component={ NotFound } />
  </Route>
);
