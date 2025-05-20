class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.integer :course_id
      t.integer :student_id
      t.integer :incidents_count

      t.timestamps
    end
  end
end
