Rails.application.routes.draw do
  devise_for :users
  # get "/article/:id/news" => 'articles#show'
  # get '/articles/news' => 'articles#clawl_news'

  #get '/articles/index' => 'articles#index'
  # get "/article_news/#{title}" => 'articles#clawl_news_show'
	resources :comments do
		resources :likes, only: [:create, :destroy]
	end
	resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
