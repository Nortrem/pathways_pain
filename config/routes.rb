Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :signs, only: [:create, :destroy]
      resource :profile, only: [:show, :create]
    end
  end
end
