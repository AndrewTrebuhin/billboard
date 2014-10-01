class CommentsController < ApplicationController
  #before_action :find_comment, only: [:show, :edit, :update, :destroy]
  before_filter :get_parent

  def new
    @comment = @parent.comments.build
  end

  def show
  end

  def edit
  end

  def create
    @comment = @parent.comments.build(comment_params)

    if @comment.save
      redirect_to board_path(@comment.board), notice: 'Thank\'s for your comment!'
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Comment successfully deleted."
    redirect_to @board
  end

  protected

    def get_parent
      @parent = Board.find_by_id(params[:board_id]) if params[:board_id]
      @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

      redirect_to root_path unless defined?(@parent)
    end

  private

    def find_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

end
