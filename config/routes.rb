Rails.application.routes.draw do
  root to: redirect('/short_urls/new')

  get '/:redirect_path', to: 'redirects#new'
  resources :short_urls, only: [:new, :create, :show]
end
