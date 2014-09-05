class ApplicationController < ActionController::Base
  protect_from_forgery

  def inplace_update
    Rails.logger.warn "####params: #{params.inspect} - #{}###"

    resource = params['resource_class'].constantize.find(params['resource_id'])

    begin

      Rails.logger.warn "####can?(:update, resource): #{can?(:update, resource).inspect} - #{}###"
      raise 'not permitted' unless can? :update, resource

      Rails.logger.warn "####params['resource']: #{params['resource'].inspect} - #{}###"
      saved = resource.update_attributes params['resource']

      raise 'problem on save' unless saved

      render :text => 'success'

    rescue Exception => e
      raise e
      render :text => e.message

    end
  end
end
