Rails.application.routes.draw do

  resources :users
get '/' => "site#index"

get '/sound' => "site#sound"

match '/contacts', to: 'contacts#new', via: 'get'
resources "contacts", only: [:new, :create]

end
