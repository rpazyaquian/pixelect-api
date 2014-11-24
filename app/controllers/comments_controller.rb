class CommentsController < ApplicationController
  def index
    @comments = Comment.includes(:user).all
  end
  def show
    @comment = Comment.find(params[:id])
  end
  def create
    @comment = Comment.create(comment_params)
  end
  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
  end
  private

    def comment_params
      params.require(:comment).permit(:text)
    end
end
