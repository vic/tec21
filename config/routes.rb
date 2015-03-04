Rails.application.routes.draw do

  resources :stories

  root 'welcome#index'
  
  controller :welcome do
    get :home, :logout
    post :signup, :login
  end

end
