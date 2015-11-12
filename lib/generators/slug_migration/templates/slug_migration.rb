class AddSlugTo<%= slugged_model_class_name %>< ActiveRecord::Migration
  def change
    add_column :<%= slugged_model_table.to_sym %>, :<%= slug_column_name %>, :string
    add_index :<%= slugged_model_table.to_sym %>, :<%= slug_column_name %>, unique: true
  end
end
