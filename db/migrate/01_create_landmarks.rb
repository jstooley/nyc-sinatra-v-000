class CreateLandmarks < ActiveRecord::Migration
  raise "Write CreateLandmarks migration here"
  create_table :landmarks do |t|
    t.string :name
    t.integer :figure_id
    t.integer :year_complete
    t.timestamps null: false
  end
end
