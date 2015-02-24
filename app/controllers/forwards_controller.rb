class ForwardsController < ApplicationController

  def fwd
    Event.create(ip: request.remote_ip, what: 'paid', data: params['slug'])
    redirect_to Forward.find_by(slug: params['slug']).url
  end

end
