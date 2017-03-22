Planning Poker
---------------

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
