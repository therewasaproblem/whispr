class QuickFix < ActiveRecord::Migration[5.2]
  def change
    drop_table(:news_users)

    create_table :news_users, id: false do |t|
      t.belongs_to :news, index: true
      t.belongs_to :user, index: true
    end
  end
end
