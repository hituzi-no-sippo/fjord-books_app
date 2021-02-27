# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_attach_resource, only: %i[edit update create destroy]
  before_action :comment_user?, only: %i[update destroy]

  def create
    comment = Comment.new(comment_params.merge(
                            { attachable: @attach_resource, user: current_user }
                          ))

    redirect_to(
      polymorphic_path(@attach_resource),
      if comment.save
        { notice: t('controllers.common.notice_create',     name: Comment.model_name.human) }
      else
        { alert:  t('controllers.common.alert_create_fail', name: Comment.model_name.human) }
      end
    )
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to polymorphic_path(@attach_resource), notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy

    redirect_to polymorphic_path(@attach_resource), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_attach_resource
    model_name = request.path.split('/')[1].classify
    @attach_resource = model_name.constantize.find(params["#{model_name.downcase}_id".to_sym])
  end

  def comment_user?
    redirect_to polymorphic_path(@attach_resource), alert: t('controllers.common.alert_not_allow') unless @comment.comment_user?(current_user.id)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
