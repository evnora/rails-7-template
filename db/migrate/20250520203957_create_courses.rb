class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :enrollments_count

      t.timestamps
    end
  end
end
