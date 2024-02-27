Rails.application.routes.draw do
    devise_for :users
    
    resources :books do
        collection do
            get :index, defaults: { format: :json }
        end
    end
end
  