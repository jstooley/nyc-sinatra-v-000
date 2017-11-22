class CreateFigureLandmarks < ActiveRecord::Migration
  def change
    create_table :figure_landmarks do |t|
      t.integer :figure_id
      t.integer :landmark_id
      t.timestamps null: false
    end
  end
end
