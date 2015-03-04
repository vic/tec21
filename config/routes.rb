Rails.application.routes.draw do

  root 'welcome#index'
  
  post :signup, :login

end
