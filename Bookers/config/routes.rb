Rails.application.routes.draw do
get '/' => 'books#top'
get '/books' => 'books#index'
post 'books_path' => 'books#create'
post 'destroy_path' => 'books#destroy'
resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
