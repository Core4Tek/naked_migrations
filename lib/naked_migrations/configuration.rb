require 'singleton'

module NakedMigrations
  class Configuration
    include Singleton

    attr_accessor :config_file, :config_template

    def initialize
      @parameters = {}
      @config_file = 'config/database.yml'
      @config_template = 'lib/naked_migrations/templates/database.yml.erb'
    end

    alias configure instance_eval

    def fetch(key)
      @parameters[key]
    end

    def set(key, value)
      @parameters[key] = value
    end
  end
end