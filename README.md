Planning Poker
---------------

Planning poker App for remote teams

[![Build Status](https://travis-ci.org/mjacobus/planning_poker.svg?branch=master)](https://travis-ci.org/mjacobus/planning_poker)
[![Code Coverage](https://scrutinizer-ci.com/g/mjacobus/planning_poker/badges/coverage.png?b=master)](https://scrutinizer-ci.com/g/mjacobus/planning_poker/?branch=master)
[![Code Climate](https://codeclimate.com/github/mjacobus/planning_poker/badges/gpa.svg)](https://codeclimate.com/github/mjacobus/planning_poker)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/mjacobus/planning_poker/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/mjacobus/planning_poker/?branch=master)
[![Dependency Status](https://gemnasium.com/badges/github.com/mjacobus/planning_poker.svg)](https://gemnasium.com/github.com/mjacobus/planning_poker)

### Project Setup

Installing dependencies, creates database

```bash
bundle install
bundle exec hanami db prepare
bundle exec hanami db migrate
```

Starting the server:

```bash
bundle exec hanami server
```

Navigate to [localhost:2300](http://localhost:2300)

### Running the tests

```bash
HANAMI_ENV=test bundle exec hanami db prepare
HANAMI_ENV=test bundle exec hanami db migrate
```

Running the tests

```bash
bundle exec rspec
```

Navigate to [localhost:2300](http://localhost:2300)


### Project Setup Frontend

Install dependencies:

```bash
cd client
npm install
```

Start dev server:

```bash
cd client
npm run start
```

Navigate to [localhost:3000](http://localhost:3000)

Build:

```bash
cd client
npm run build
```
