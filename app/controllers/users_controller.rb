class UsersController < ApplicationController
  before_action :authenticate_user!
    
  def show
    render 'root'
  end
end
