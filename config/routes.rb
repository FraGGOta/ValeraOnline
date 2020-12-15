Rails.application.routes.draw do
  get 'hello/index'
  get 'game' => 'game#index'
  get 'menu' => 'menu#index'
end
