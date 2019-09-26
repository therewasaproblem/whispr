class AddUniqueIndexToNews < ActiveRecord::Migration[5.2]
  def change
    add_index :news, [:url, :title, :summary], unique: true
  end
end
