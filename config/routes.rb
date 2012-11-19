HelpCenter::Application.routes.draw do
  root to: "topics#index"
  match "index" => "topics#index"

  match "search" => "topics#search"
  match "admin/" => "topics#edit_all"

  get "/:id" => "topics#show", as: :show_root_topic

  scope "/admin" do
    resources :topics, except: [:index, :show]
    resources :basic_guides, only: [:new, :create, :update]
    resources :faqs, only: [:new, :create, :update]
    resources :guides, only: [:new, :create, :update]
  end

  resources :topics, only: [:index]
  get "/:root_id/:id" => "topics#show", as: :show_topic

  ActionDispatch::Routing::Translator.translate_from_file('lang/i18n-routes.yml', { :no_prefixes => true })
end
