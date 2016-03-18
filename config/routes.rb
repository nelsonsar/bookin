Rails.application.routes.draw do
  get 'books/new' => 'books#new'
  post 'books' => 'books#create'
  get 'books/show/:guid' => 'books#show'
end
