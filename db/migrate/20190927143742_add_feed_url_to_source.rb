class AddFeedUrlToSource < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :feed_url, :string
  end
end
