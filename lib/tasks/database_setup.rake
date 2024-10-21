namespace :db do
  desc "Set up the development database by dropping, creating, migrating and seeding"
  task database_setup: :environment do
    if Rails.env.development?
      puts "Environment is development. Setting up the database..."

      commands = [ "db:drop", "db:create", "db:migrate", "db:seed" ]

      commands.each do |command|
        Rake::Task[command].invoke
      end

      puts "Database setup completed"
    else
      puts "This task can only be run in the development environment"
    end
  end
end
