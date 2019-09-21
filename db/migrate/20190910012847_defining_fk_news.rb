class DefiningFkNews < ActiveRecord::Migration[5.2]
  def change
	  add_foreign_key :news, :sources
    add_foreign_key :news, :categories
  end
end
