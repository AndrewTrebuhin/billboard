class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.login || user.email
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      flash[:notice] = "User successfully created."
      redirect_to @user
    else
      flash.now[:alert] = @user.errors.full_messages.first
      render "new"
    end
  end

  def update
    @user.update_attributes(user_params)
    if @user.errors.empty?
      flash[:notice] = "Profile updated."
      redirect_to @user
    else
      flash.now[:alert] = @user.errors.full_messages.first
      render "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User successfully deleted."
    redirect_to users_url
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:login, :full_name, :birthday, :zip,
                                   :country, :state, :city, :address, :role)
    end
end
