class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
    @past_events = @user.past_events
    @upcoming_events = @user.upcoming_events
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
