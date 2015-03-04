class WelcomeController < ApplicationController
  
  def index
    
    if session[:user_id].present?
      user = User.find session[:user_id]
      render action: 'heydude'
    end
    
  end
  
  def signup
    user = User.create(signup_params)
    session[:user_id] = user.id
  end
  
  def login
  end
  
  
  private
  
  def signup_params
    params.permit(:name, :email, :password)
  end
  
end