require 'rails/generators/base'
require 'rails/generators/active_record'
class SlugMigrationGenerator < Rails::Generators::Base
  include ActiveRecord::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)
  argument :slugged_model, type: :string, required: true
  class_option :slug_name, type: :string, default: 'slug'

  def create_migration_file
    migration_template "slug_migration.rb", "db/migrate/add_slug_to_#{slugged_model_table}.rb"
  end

  private

  def slugged_model_table
    slugged_model.underscore.pluralize
  end

  def slugged_model_class_name
    slugged_model.camelcase
  end

  def slug_column_name
    options.fetch("slug_name").underscore
  end
end
