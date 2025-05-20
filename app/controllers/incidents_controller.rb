class IncidentsController < ApplicationController
  def index
    matching_incidents = Incident.all

    @list_of_incidents = matching_incidents.order({ :created_at => :desc })

    render({ :template => "incidents/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_incidents = Incident.where({ :id => the_id })

    @the_incident = matching_incidents.at(0)

    render({ :template => "incidents/show" })
  end

  def create
    the_incident = Incident.new
    the_incident.behavior_id = params.fetch("query_behavior_id")
    the_incident.enrollment_id = params.fetch("query_enrollment_id")
    the_incident.occurred_at = params.fetch("query_occurred_at")

    if the_incident.valid?
      the_incident.save
      redirect_to("/incidents", { :notice => "Incident created successfully." })
    else
      redirect_to("/incidents", { :alert => the_incident.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_incident = Incident.where({ :id => the_id }).at(0)

    the_incident.behavior_id = params.fetch("query_behavior_id")
    the_incident.enrollment_id = params.fetch("query_enrollment_id")
    the_incident.occurred_at = params.fetch("query_occurred_at")

    if the_incident.valid?
      the_incident.save
      redirect_to("/incidents/#{the_incident.id}", { :notice => "Incident updated successfully."} )
    else
      redirect_to("/incidents/#{the_incident.id}", { :alert => the_incident.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_incident = Incident.where({ :id => the_id }).at(0)

    the_incident.destroy

    redirect_to("/incidents", { :notice => "Incident deleted successfully."} )
  end
end
