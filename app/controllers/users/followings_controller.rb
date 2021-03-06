# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def show
    @users = User.find(params[:id]).followings.order('user_followings.id').page(params[:page])
  end

  def create
    following = current_user.following_relationships.build(following_id: params[:id])

    message = if following.save
                { notice: t('controllers.common.notice_success', event: t('followings.follow')) }
              elsif following.errors.full_messages.include?(t('errors.format', attribute: 'Following', message: t('errors.messages.taken')))
                { notice: t('followings.already_followed') }
              else
                { alert: following.errors.full_messages }
              end

    redirect_to(user_path(params[:id]), message)
  end

  def destroy
    follow = current_user.following_relationships.find_by(following_id: params[:id])

    message = if follow.nil?
                { notice: t('followings.not_following') }
              elsif follow.destroy
                { notice: t('controllers.common.notice_success', event: t('followings.unfollow')) }
              else
                { alert: following.errors.full_messages }
              end

    redirect_to(user_path(params[:id]), message)
  end
end
