Rails.application.routes.draw do
  root to: redirect('/short_urls/new')

  get '/:redirect_path', to: 'redirects#show'
  resources :short_urls, only: [:new, :create, :show]
end
