class AddAccessToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :access, :bigint, default: 0
  end
end
