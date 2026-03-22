class CreatePolls < ActiveRecord::Migration[8.1]
  def change
    create_table :polls do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.boolean :active, default: true
      t.references :created_by, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
