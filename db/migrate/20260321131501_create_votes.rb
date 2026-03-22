class CreateVotes < ActiveRecord::Migration[8.1]
  def change
    create_table :votes do |t|
      t.references :user,  null: false, foreign_key: true
      t.references :poll,  null: false, foreign_key: true
      t.string :choice, null: false   # "veg", "non_veg", "absent"
      t.timestamps
    end
    add_index :votes, [:user_id, :poll_id], unique: true
  end
end
