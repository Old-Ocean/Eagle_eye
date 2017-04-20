Rails.application.routes.draw do
  devise_for :users

  get "/newses" => 'articles#newses'
  get '/news/:id' => 'articles#news', as: :news

  #get '/articles/index' => 'articles#index'
  # get "/article_news/#{title}" => 'articles#clawl_news_show'

	resources :articles do
    resources :comments, only:[:create, :destroy]
  end
  root 'articles#newses'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
