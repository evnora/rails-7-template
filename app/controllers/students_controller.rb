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

  def create
    the_student = Student.new
    the_student.name = params.fetch("query_name")
    the_student.enrollments_count = params.fetch("query_enrollments_count")

    if the_student.valid?
      the_student.save
      redirect_to("/students", { :notice => "Student created successfully." })
    else
      redirect_to("/students", { :alert => the_student.errors.full_messages.to_sentence })
    end
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
end
