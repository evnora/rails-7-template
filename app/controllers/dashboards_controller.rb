class DashboardsController < ApplicationController
  def show
    # Step 1: Get all enrollments (each one connects a student to a course)
    @enrollments = Enrollment.includes(:student, :course, :incidents => :behavior).all

    # Step 2: Optional — filter just students with IEPs if you have that column
    # Example (uncomment if you have an iep field):
    # @enrollments = @enrollments.where(students: { iep: true })

    # Step 3: Build behavior summaries
    @student_behavior_data = @enrollments.group_by(&:student).transform_values do |student_enrollments|
      student_enrollments.flat_map(&:incidents)
    end
  end
end
