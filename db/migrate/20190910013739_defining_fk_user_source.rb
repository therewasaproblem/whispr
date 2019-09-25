class DefiningFkUserSource < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :user_sources, :users
  	add_foreign_key :user_sources, :sources
  end
end
