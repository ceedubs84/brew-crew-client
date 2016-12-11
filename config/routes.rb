Rails.application.routes.draw do
  get '/' => 'brews#index'
  get '/brews' => 'brews#index'
  post '/'
  get '/brews'
  get '/brews/:id' => 'brews#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end