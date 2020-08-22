class AddSttToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :create_time, :datetime
    add_column :articles, :update_time, :datetime
  end
end
