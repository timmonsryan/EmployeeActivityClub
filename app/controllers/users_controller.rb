class UsersController < ApplicationController
  before_action :verifyAdmin, only: [:destroy]
  def index
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid Signup"
      render 'new'
    end
  end

  def destroy
  end

  def edit
  end

  private
  	def user_params
  		params.require(:user).permit(:tellerNumber, :firstName,
  									 :lastName, :password, :password_confirmation,
  									 :department)
  	end
end
