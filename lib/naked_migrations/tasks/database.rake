require 'highline/import'

namespace :db do
  desc 'Create the database config file'
  task :config do
    configuration = NakedMigrations::Configuration.instance

    database_config_file = configuration.config_file
    database_config_template = configuration.config_template
    project_name = File.dirname('../') # Parent directory is the default database name

    abort if File.exists?(database_config_file) && !agree('The database config file already exists. Overwrite?')

    set(:database_host, ask('Server name: ') { |q| q.default = 'localhost' })
    set(:database_port, ask('Port number: ') { |q| q.default = '3306' })
    set(:database_name, ask('Database Name: ') { |q| q.default = project_name })
    set(:database_user, ask('Username: ') { |q| q.default = 'root' })
    set(:database_password, ask('Password: ') { |q| q.default = '' })

    template = ERB.new(File.read(database_config_template))
    File.open(database_config_file, 'w') {|f| f.write(template.result(binding)) }

    puts("Config file written to #{database_config_file}")
  end
end
