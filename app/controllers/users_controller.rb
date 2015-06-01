class UsersController < ApplicationController
  def signup
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    @user.email = params[:email]
    puts params[:user]
    if @user.save
      render 'successful_registration'
    else
      render status: 500
    end
  end
end
