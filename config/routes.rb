Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end

  devise_for :users
  root 'top#index'

  resources :photos, only: [:index, :new, :create,
    :destroy, :edit, :update] do
    collection do
      post :confirm
    end
end
end
