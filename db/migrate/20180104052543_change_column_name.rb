class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :urls, :url, :link
  end
end
