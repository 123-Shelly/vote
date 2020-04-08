Rails.application.routes.draw do
	
  resources :candidates do
  	member do
  		post :vote
    end
  end
    


  
  get '/', to: 'candidates#index'
  get '/index', to: 'candidates#index'
  get '/index/new', to: 'candidates#new'
  post '/index/new', to: 'candidates#new'
  get '/candidate/:id', to: 'candidates#show'
  get '/candidates/:id/edit', to: 'candidates#edit'
  # post '/candidates/:id/voit', to: 'candidates#voit'
  # get '/candidate/3', to: 'candidates#show'
  # get '/candidate/4', to: 'candidates#show'
  # get '/candidate/5', to: 'candidates#show'




end
