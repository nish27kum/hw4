class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string "name"
      t.integer "user_id"

      t.timestamps
    end
  end
end