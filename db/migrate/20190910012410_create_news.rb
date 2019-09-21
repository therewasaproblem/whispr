class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :summary
      t.text :url
      t.integer :category_id
      t.integer :source_id

      t.timestamps
    end
  end
end
