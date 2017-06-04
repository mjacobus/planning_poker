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

namespace :dev do
  namespace :db do
    desc "fake records for development"
    task populate: :environment do
      require_relative 'spec/support/test_factory.rb'
      factory = TestFactory.new

      1.upto(10) do |num|
        room = factory.create_room(
          admin_uuid: "admin-uuid-#{num}",
          voting_uuid: "uuid-#{num}",
        )

        1.upto(10) do
          factory.create_story(room_id: room.id, estimation: 5)
        end
      end
    end

    desc "clear database"
    task clear: :environment do
      require_relative 'spec/support/test_factory.rb'
      factory = TestFactory.new
      factory.clear_all
    end

    desc "clears and repopulates"
    task repopulate: :environment do
      Rake::Task['dev:db:clear'].invoke
      Rake::Task['dev:db:populate'].invoke
    end
  end
end
