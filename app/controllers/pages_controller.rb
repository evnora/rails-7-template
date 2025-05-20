class PagesController < ApplicationController
   def home
     matching_courses = Course.where({})
     @courses = matching_courses

     render({ :template => "page_templates/home"})
   end
 end
