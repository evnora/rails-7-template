class PagesController < ApplicationController
  def home
    @courses  = Course.where({})
    @students = Student.where({})

    render({ :template => "page_templates/home" })
  end
end
