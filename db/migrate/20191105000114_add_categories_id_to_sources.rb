class AddCategoriesIdToSources < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :categories_id, :integer
  end
end
