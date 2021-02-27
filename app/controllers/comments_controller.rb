# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_attach_resource, only: %i[create]

  def create
    comment = Comment.new(comment_params.merge(
                            { attachable: @attach_resouce, user: current_user }
                          ))

    redirect_to(
      polymorphic_path(@attach_resouce),
      if comment.save
        { notice: t('controllers.common.notice_create',     name: Comment.model_name.human) }
      else
        { alert:  t('controllers.common.alert_create_fail', name: Comment.model_name.human) }
      end
    )
  end

  private

  def set_attach_resource
    model_name = request.path.split('/')[1].classify
    @attach_resouce = model_name.constantize.find(params["#{model_name.downcase}_id".to_sym])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
