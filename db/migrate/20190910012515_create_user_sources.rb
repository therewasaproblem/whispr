class CreateUserSources < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sources do |t|
      t.integer :user_id
      t.integer :source_id

      t.timestamps
    end
  end
end
