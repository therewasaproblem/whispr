class CreateJoinTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_sources
    drop_table :user_news
    drop_table :user_categories

    create_join_table :categories, :users do |t|
      t.index :category_id
      t.index :user_id
    end

    create_join_table :news, :users do |t|
      t.index :news_id
      t.index :user_id
    end

    create_join_table :sources, :users do |t|
      t.index :source_id
      t.index :user_id
    end
  end
end
