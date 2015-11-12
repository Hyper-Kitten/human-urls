require 'test_helper'
require 'generators/slug_migration/slug_migration_generator'

module HumanUrls
  class SlugMigrationGeneratorTest < Rails::Generators::TestCase
    tests SlugMigrationGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    test "generator creates proper migration" do
      run_generator ["posts"]
      assert_migration "db/migrate/add_slug_to_posts.rb" do |migration|
        assert_instance_method :change, migration do |change|
          assert_match(/add_column :posts, :slug, :string/, change)
          assert_match(/add_index :posts, :slug, unique: true/, change)
        end
      end
    end

    test "generator creates proper migration when using custom slug column" do
      run_generator ["posts", "--slug-name=url"]
      assert_migration "db/migrate/add_slug_to_posts.rb" do |migration|
        assert_instance_method :change, migration do |change|
          assert_match(/add_column :posts, :url, :string/, change)
          assert_match(/add_index :posts, :url, unique: true/, change)
        end
      end
    end
  end
end
