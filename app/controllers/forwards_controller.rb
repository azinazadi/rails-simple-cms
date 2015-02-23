class ForwardsController < ApplicationController

  def fwd
    redirect_to Forward.find_by(slug: params['slug']).url
  end

end
