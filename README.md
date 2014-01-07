# Naked Migrations

A thin wrapper for rosenfeld's [active_record_migrations](https://github.com/rosenfeld/active_record_migrations) gem
with some additional tasks for creating the appropriate database config files for development and deployment.

## Prerequisites

Install Bundler and Rake (in the highly unlikely event that you have not done so already)

```
gem install bundler
gem install rake
```

## Installation

Add the following to your application's Gemfile:

```
gem 'naked_migrations'
gem 'mysql2' # Only supports MySQL for now
```

Create a Rakefile and add the following:

```
require 'naked_migrations'
NakedMigrations.load_rake_tasks
```

## Usage

Naked migrations adds a new rake task to automatically create your database config file. It only supports
MySQL for now, but support for different databases is planned.

Execute the following and follow the prompts:

```
rake db:config
```

For more info about the other rake tasks made available by this library, check out:

* [active_record_migrations](https://github.com/rosenfeld/active_record_migrations)
* [Migrations Guide](http://guides.rubyonrails.org/migrations.html)

## Deployment

If you are deploying using Capistrano 3, this library contains a task for configuring your database config file in the
shared directory.  Run the following and follow the prompts.

```
cap staging db:config
```
