class WelcomeController < ApplicationController
  
  def index
    if session[:user_id].present?
      redirect_to action: 'home'
    end
  end
  
  def home
    @user = current_user
  end

  def signup
    user = User.new(signup_params)
    if user.save
      new_session(user)
    else
      @errors = user.errors.full_messages
      render action: 'index'
    end
  end
  
  def login
    user = User.find_by email: params[:email]
    if user && user.password == params[:password]
      new_session(user)
    end
  end
  
  def logout
    session.delete(:user_id)
    redirect_to :root
  end
  
  
  private
  
  def new_session(user)
    session[:user_id] = user.id
    redirect_to action: 'home'
  end
  
  def signup_params
    params.permit(:name, :email, :password)
  end
  
  def current_user
     User.find session[:user_id]
  end
  
end