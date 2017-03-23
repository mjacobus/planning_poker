require 'rake'
require 'hanami/rake_tasks'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: 'spec:coverage'
rescue LoadError
end

namespace :spec do
  desc "execute tests and give code coverage report"
  task :coverage do
    ENV['CODE_COVERAGE'] = "true"
    Rake::Task['spec'].invoke
  end
end
