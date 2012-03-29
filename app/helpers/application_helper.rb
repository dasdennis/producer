module ApplicationHelper

  def error_messages_for(resource)
    render partial: "error_messages_for", 
      locals: { resource: resource }
  end

end
