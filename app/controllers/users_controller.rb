class UsersController < ApplicationController
  before_action :authenticate_user!
    
  def display
    render 'root'
  end
end
