Rails.application.routes.draw do

  # Routes for the Student resource:

  # CREATE
  post("/insert_student", { :controller => "students", :action => "create" })
          
  # READ
  get("/students", { :controller => "students", :action => "index" })
  
  get("/students/:path_id", { :controller => "students", :action => "show" })
  
  # UPDATE
  
  post("/modify_student/:path_id", { :controller => "students", :action => "update" })
  
  # DELETE
  get("/delete_student/:path_id", { :controller => "students", :action => "destroy" })

  #------------------------------

  # Routes for the Incident resource:

  # CREATE
  post("/insert_incident", { :controller => "incidents", :action => "create" })
          
  # READ
  get("/incidents", { :controller => "incidents", :action => "index" })
  
  get("/incidents/:path_id", { :controller => "incidents", :action => "show" })
  
  # UPDATE
  
  post("/modify_incident/:path_id", { :controller => "incidents", :action => "update" })
  
  # DELETE
  get("/delete_incident/:path_id", { :controller => "incidents", :action => "destroy" })

  #------------------------------

  # Routes for the Behavior resource:

  # CREATE
  post("/insert_behavior", { :controller => "behaviors", :action => "create" })
          
  # READ
  get("/behaviors", { :controller => "behaviors", :action => "index" })
  
  get("/behaviors/:path_id", { :controller => "behaviors", :action => "show" })
  
  # UPDATE
  
  post("/modify_behavior/:path_id", { :controller => "behaviors", :action => "update" })
  
  # DELETE
  get("/delete_behavior/:path_id", { :controller => "behaviors", :action => "destroy" })

  #------------------------------

  # Routes for the Enrollment resource:

  # CREATE
  post("/insert_enrollment", { :controller => "enrollments", :action => "create" })
          
  # READ
  get("/enrollments", { :controller => "enrollments", :action => "index" })
  
  get("/enrollments/:path_id", { :controller => "enrollments", :action => "show" })
  
  # UPDATE
  
  post("/modify_enrollment/:path_id", { :controller => "enrollments", :action => "update" })
  
  # DELETE
  get("/delete_enrollment/:path_id", { :controller => "enrollments", :action => "destroy" })

  #------------------------------

  # Routes for the Course resource:

  # CREATE
  post("/insert_course", { :controller => "courses", :action => "create" })
          
  # READ
  get("/courses", { :controller => "courses", :action => "index" })
  
  get("/courses/:path_id", { :controller => "courses", :action => "show" })
  
  # UPDATE
  
  post("/modify_course/:path_id", { :controller => "courses", :action => "update" })
  
  # DELETE
  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  #------------------------------

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"

  get("/", { :controller => "pages", :action => "home" })
  
end
