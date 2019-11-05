class DropUsersCategoriesTable < ActiveRecord::Migration[5.2]
  def change
  drop_table(:user_categories)
  end
end
