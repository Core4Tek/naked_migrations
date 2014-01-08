require 'singleton'

module NakedMigrations
  class Configuration
    include Singleton

    attr_accessor :config_file, :config_template, :default_database_name

    def initialize
      @parameters = {}
      @config_file = 'config/database.yml'
      @config_template = File.join(File.dirname(File.expand_path(__FILE__)), 'templates/database.yml.erb')
      @default_database_name = parent_dir
    end

    alias configure instance_eval

    def fetch(key)
      @parameters[key]
    end

    def set(key, value)
      @parameters[key] = value
    end

    private

    def parent_dir
      Dir.pwd.split('/').last
    end
  end
end