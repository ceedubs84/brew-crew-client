Rails.application.routes.draw do
  get 'brews/index' => 'brews#index'

  get 'brews/show/:id' => 'brews#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end