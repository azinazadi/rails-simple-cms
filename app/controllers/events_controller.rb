class EventsController < ApplicationController

  def create
    Event.create(ip: request.remote_ip, what: params['what'])
    render :nothing => true
  end

end
