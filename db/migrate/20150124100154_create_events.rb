class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :time
      t.integer :creator_id
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :users
  end
end
