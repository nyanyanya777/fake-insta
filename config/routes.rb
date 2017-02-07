Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'top#index'

  resources :photos, only: [:index, :new, :create,
    :destroy, :edit, :update] do
    collection do
      post :confirm
    end
end

if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end

end
