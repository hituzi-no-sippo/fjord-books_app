# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def show
    @users = User.find(params[:id]).followers.order('user_followings.id').page(params[:page])
  end
end
