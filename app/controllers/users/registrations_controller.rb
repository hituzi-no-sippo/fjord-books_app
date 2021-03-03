# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def build_resource(hash = {})
    hash[:uid] = SecureRandom.uuid
    super
  end

  def update_resource(resource, params)
    if params[:password].blank?
      params.delete(:current_password)
      resource.update_without_password(params)
    else
      super
    end
  end
end
