class AddMenuToPoll < ActiveRecord::Migration[8.1]
  def change
    add_column :polls, :hotel_name, :text
  end
end
