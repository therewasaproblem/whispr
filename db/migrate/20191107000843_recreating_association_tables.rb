class RecreatingAssociationTables < ActiveRecord::Migration[5.2]
  def change
    drop_table(:user_sources)

    drop_table(:user_news)

    create_table :sources_news, id: false do |t|
      t.belongs_to :source, index: true
      t.belongs_to :user, index: true
    end
    
    create_table :news_users, id: false do |t|
      t.belongs_to :news, index: true
      t.belongs_to :users, index: true
    end
  end
end
