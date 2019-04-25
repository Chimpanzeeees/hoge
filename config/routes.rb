Rails.application.routes.draw do

  get 'dengonban', to: 'dengonban#index'
  post 'dengonban', to: 'dengonban#index'
  get 'dengonban/index'
  post 'dengonban/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'helo/index'
  get 'index', to: 'helo#index'

  post 'helo/index'
  post 'index', to: 'delo#index'

  get 'helo/other'
  get 'other', to: 'helo#other'

  get 'helo/piyo'
  get 'piyo', to: 'helo#piyo'

end
