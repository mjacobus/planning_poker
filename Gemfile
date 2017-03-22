source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '1.0.0.beta3'
gem 'hanami-model', '~> 1.0.0.beta3'

# frontend
gem 'sass'
gem 'babel-transpiler'

# middleware
gem 'rack-cors', :require => 'rack/cors'

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
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
