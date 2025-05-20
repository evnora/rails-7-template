class CreateBehaviors < ActiveRecord::Migration[7.1]
  def change
    create_table :behaviors do |t|
      t.string :name
      t.integer :incidents_count

      t.timestamps
    end
  end
end
