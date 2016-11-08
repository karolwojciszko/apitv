Rails.application.routes.draw do
  get 'tvguide/get'

  get 'welcome/index'
  root get 'tvguide#get'
  #root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
