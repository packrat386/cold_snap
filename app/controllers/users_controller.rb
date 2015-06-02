class UsersController < ApplicationController
  def signup
  end

  def create
    @user = User.new(params)
    if @user.save
      render 'successful_registration'
    else
      render status: 500
    end
  end

  def display
    render 'root'
  end
end
