module Rein
  module Constraint
  end
end

RC = Rein::Constraint

require "active_record"
require "active_support/core_ext/hash"
require "active_support/inflector"
require 'active_record/connection_adapters/abstract_mysql_adapter'
require 'active_record/connection_adapters/postgresql_adapter'

require "rein/constraint/primary_key"
require "rein/constraint/foreign_key"
require "rein/constraint/inclusion"
require "rein/constraint/numericality"
require "rein/constraint/presence"
require "rein/view"

module ActiveRecord::ConnectionAdapters
  class MysqlAdapter < AbstractMysqlAdapter
    include RC::PrimaryKey
    include RC::ForeignKey
    include Rein::View
  end

  class Mysql2Adapter < AbstractMysqlAdapter
    include RC::PrimaryKey
    include RC::ForeignKey
    include Rein::View
  end

  class PostgreSQLAdapter
    include RC::PrimaryKey
    include RC::ForeignKey
    include RC::Inclusion
    include RC::Numericality
    include RC::Presence
    include Rein::View
  end
end
