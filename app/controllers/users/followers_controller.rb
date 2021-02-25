# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def show
    @users = User.find(params[:id]).followers.page(params[:page])
  end
end
