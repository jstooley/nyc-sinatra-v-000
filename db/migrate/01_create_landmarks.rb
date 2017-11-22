class CreateLandmarks < ActiveRecord::Migration
  create_table :landmarks do |t|
    t.string :name
    t.integer :figure_id
    t.integer :year_completed
    t.timestamps null: false
  end
end
