require 'forwardable'
require 'lib/naked_migrations'

$configuration = NakedMigrations::Configuration.instance

#
# <tt>require "naked_migrations/import"</tt> adds shortcut methods to Kernel, making
# set() and fetch() globally available.  This so that the template used to write the
# database config file works seamlessly in both rake and Capistrano 3.
#
module Kernel
  extend Forwardable
  def_delegators :$configuration, :fetch, :set
end