class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    @ride = Ride.new(user_id: @user.id, attraction_id: params[:attraction_id])
    if @ride.take_ride == true
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    else
      flash[:notice] = "#{@ride.take_ride}"
    end
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
