class BoardsController < ApplicationController

  before_action :find_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.paginate(:page => params[:page], :per_page => 8)
  end

  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = current_user.boards.create(board_params)
    if @board.errors.empty?
      flash[:notice] = "Board successfully created."
      redirect_to boards_url
    else
      flash.now[:alert] = @board.errors.full_messages.first
      render "new"
    end
  end

  def update
    @board.update_attributes(board_params)
    if @board.errors.empty?
      flash[:notice] = "Board updated."
      redirect_to boards_url
    else
      flash.now[:alert] = @board.errors.full_messages.first
      render "new"
    end
  end

  def destroy
    @board.destroy
    flash[:notice] = "Board successfully deleted."
    redirect_to boards_url
  end

  private

    def find_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:description, :image)
    end
end
