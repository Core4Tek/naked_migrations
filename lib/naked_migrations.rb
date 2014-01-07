require 'naked_migrations/configuration'

module NakedMigrations
  LOCAL_TASKS = %w{db:config}

  def self.configure(&block)
    configuration.configure &block
  end

  def self.load_rake_tasks
    # Import custom tasks
    load 'naked_migrations/tasks/database.rake'

    unless LOCAL_TASKS.include? current_rake_task
      require 'active_record_migrations'

      config_file = configuration.config_file
      ActiveRecordMigrations.configure do |c|
        c.yaml_config = config_file
      end

      ActiveRecordMigrations.load_tasks
    end
  end

  def self.load_capistrano_tasks
    require 'capistrano/setup'
    require 'capistrano/deploy'
    require 'capistrano/bundler'
    require 'capistrano/rails/migrations'

    # Import custom database tasks
    load 'naked_migrations/tasks/database.cap'
  end

  private

  def self.current_rake_task
    ARGV[0] || ''
  end

  def self.configuration
    Configuration.instance
  end
end
