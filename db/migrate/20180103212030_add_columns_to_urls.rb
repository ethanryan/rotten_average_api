class AddColumnsToUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :title, :string
    add_column :urls, :movie_or_tv, :string
    add_column :urls, :tomato_meter, :string
    add_column :urls, :audience_score, :string
  end
end
