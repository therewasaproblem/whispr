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

    create_table :sources_users do |t|
      t.belongs_to :user
      t.belongs_to :source
    end

    create_table :categories_users do |t|
      t.belongs_to :user
      t.belongs_to :category
    end

    create_table :news_users do|t|
      t.belongs_to :user
      t.belongs_to :news
    end

  end
end
