class EventsController < ApplicationController

  def create
    # Event.create(ip: request.remote_ip, what: params['what'], data:params['data'])
    render :nothing => true
  end

end
