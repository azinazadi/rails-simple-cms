class HomeController < ApplicationController
  before_filter :fetch_page

  def index
  end

  def emine
    render :layout => false
  end

  private
  def fetch_page
    @page = Page.find_by_name params['action']
  end
end
