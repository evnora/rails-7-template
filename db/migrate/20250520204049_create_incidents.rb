class CreateIncidents < ActiveRecord::Migration[7.1]
  def change
    create_table :incidents do |t|
      t.integer :behavior_id
      t.integer :enrollment_id
      t.string :occurred_at

      t.timestamps
    end
  end
end
