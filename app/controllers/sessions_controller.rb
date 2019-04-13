# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  include ActionController::Cookies
  respond_to :json

  def create
    super
    p resource.email
    cookies[:user_email] = resource.email
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
