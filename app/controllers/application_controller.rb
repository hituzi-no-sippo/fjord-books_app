# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def after_sign_out_path_for(_)
    new_user_session_path
  end
end
