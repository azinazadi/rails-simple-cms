class HomeController < ApplicationController
  before_filter :fetch_page

  def index

  end

  def page

  end

  def emine
    render :layout => false
  end

  protected
  def main_attrs
    {}
  end

  private
  def fetch_page
    @page = Page.find_by_slug params['slug']
    end
end
