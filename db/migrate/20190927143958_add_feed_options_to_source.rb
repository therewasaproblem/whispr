class AddFeedOptionsToSource < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :feed_options, :jsonb, null: false, default: {}
  end
end
