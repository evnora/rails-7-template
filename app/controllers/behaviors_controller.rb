class BehaviorsController < ApplicationController
  def index
    matching_behaviors = Behavior.all

    @list_of_behaviors = matching_behaviors.order({ :created_at => :desc })

    render({ :template => "behaviors/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_behaviors = Behavior.where({ :id => the_id })

    @the_behavior = matching_behaviors.at(0)

    render({ :template => "behaviors/show" })
  end

  def create
    the_behavior = Behavior.new
    the_behavior.name = params.fetch("query_name")
    the_behavior.incidents_count = params.fetch("query_incidents_count")

    if the_behavior.valid?
      the_behavior.save
      redirect_to("/behaviors", { :notice => "Behavior created successfully." })
    else
      redirect_to("/behaviors", { :alert => the_behavior.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_behavior = Behavior.where({ :id => the_id }).at(0)

    the_behavior.name = params.fetch("query_name")
    the_behavior.incidents_count = params.fetch("query_incidents_count")

    if the_behavior.valid?
      the_behavior.save
      redirect_to("/behaviors/#{the_behavior.id}", { :notice => "Behavior updated successfully."} )
    else
      redirect_to("/behaviors/#{the_behavior.id}", { :alert => the_behavior.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_behavior = Behavior.where({ :id => the_id }).at(0)

    the_behavior.destroy

    redirect_to("/behaviors", { :notice => "Behavior deleted successfully."} )
  end
end
