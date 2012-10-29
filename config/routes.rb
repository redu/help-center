HelpCenter::Application.routes.draw do

  root to: "topics#index"

  match "search" => "topics#search"

  resources :topics, except: [:new, :edit]
  resources :faqs, only: [:show, :create, :update]
  resources :guides, only: [:show, :create, :update]

  scope "/admin" do
    resources :topics, only: [:new, :edit]
    resources :faqs, only: [:new]
    resources :guides, only: [:new]
  end

end
