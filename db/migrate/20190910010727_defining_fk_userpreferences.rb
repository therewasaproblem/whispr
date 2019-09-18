class DefiningFkUserpreferences < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :user_preferences, :users
    add_foreign_key :user_preferences, :categories
  end
end
