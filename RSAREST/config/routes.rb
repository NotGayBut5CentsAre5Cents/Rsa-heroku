Rails.application.routes.draw do
  resources :messages
  resources :my_rsas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/rsas', to: 'my_rsas#new'
  
  post '/rsas/:id/encrypt_messages', to: 'messages#new' 
  
  post '/rsas/:id/decrypt_messages', to: 'messages#decrypt_messages'

  get '/rsas/:id', to: 'my_rsas#show'

  get '/rsas/:id/encrypt_messages/:id2', to: 'messages#show'
end
