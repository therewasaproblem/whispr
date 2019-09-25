class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :language
      t.text :homepage_url

      t.timestamps
    end
  end
end
