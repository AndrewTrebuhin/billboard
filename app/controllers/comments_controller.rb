class CommentsController < ApplicationController
  before_filter :get_parent
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

    def find_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:title, :body)
    end

    def get_parent
    end
end
