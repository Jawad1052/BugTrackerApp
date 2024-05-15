class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      @bug = Bug.find(params[:bug_id])
      @comment = @bug.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to @bug, notice: "Comment added successfully."
      else
        render 'bugs/show'
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
  end

