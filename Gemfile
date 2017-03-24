source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '1.0.0.beta3'
gem 'hanami-model', '~> 1.0.0.beta3'

# frontend
gem 'sass'
gem 'babel-transpiler'

# database
gem 'mysql2'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'pry'
  gem 'rubocop'
  gem 'reek'
  gem 'coveralls', require: false
  gem 'simplecov'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'timecop'
end

group :production do
  # gem 'puma'
end
