class StudentsController < ApplicationController
  def index
    matching_students = Student.all

    @list_of_students = matching_students.order({ :created_at => :desc })

    render({ :template => "students/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_students = Student.where({ :id => the_id })

    @the_student = matching_students.at(0)

    render({ :template => "students/show" })
  end


  def update
    the_id = params.fetch("path_id")
    the_student = Student.where({ :id => the_id }).at(0)

    the_student.name = params.fetch("query_name")
    the_student.enrollments_count = params.fetch("query_enrollments_count")

    if the_student.valid?
      the_student.save
      redirect_to("/students/#{the_student.id}", { :notice => "Student updated successfully."} )
    else
      redirect_to("/students/#{the_student.id}", { :alert => the_student.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_student = Student.where({ :id => the_id }).at(0)

    the_student.destroy

    redirect_to("/students", { :notice => "Student deleted successfully."} )
  end

  def new
    @student = Student.new
    @courses = Course.where({})
    render({ :template => "students/new" })
  end

  def create
    the_student             = Student.new
    the_student.name        = params.fetch("query_name")
    the_student.enrollments_count = 0

    if the_student.save
      params.fetch("course_ids", []).each do |course_id|
        the_enrollment               = Enrollment.new
        the_enrollment.course_id     = course_id
        the_enrollment.student_id    = the_student.id
        the_enrollment.incidents_count = 0
        the_enrollment.save
      end

      redirect_to("/students", { :notice => "Student created." })
    else
      redirect_to("/students/new", { :alert => the_student.errors.full_messages.to_sentence })
    end
  end

end
