class FixingAssociations < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_sources do |t|
      t.integer :user_id
      t.integer :source_id

      t.timestamps
    end

    drop_table :user_preferences do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end

    create_table :user_sources do |t|
      t.belongs_to :users
      t.belongs_to :sources
    end

    create_table :user_categories do |t|
      t.belongs_to :users
      t.belongs_to :categories
    end

    create_table :user_news do|t|
      t.belongs_to :users
      t.belongs_to :news
    end

  end
end
