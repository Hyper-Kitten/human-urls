class CreateTaggableWGeneratedSlugs < ActiveRecord::Migration
  def change
    create_table :taggable_w_generated_slugs do |t|
      t.string :title
      t.string :slug

      t.timestamps null: false
    end
    add_index :taggable_w_generated_slugs, :slug, unique: true
  end
end
