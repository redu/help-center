HelpCenter::Application.routes.draw do
  root to: "topics#index"
  match "index" => "topics#index"

  match "search" => "topics#search"
  match "admin/edit" => "topics#edit_all"

  get "/:id" => "topics#show", as: :show_root_topic

  resources :basic_guides, only: [:create, :update]
  resources :faqs, only: [:create, :update]
  resources :guides, only: [:create, :update]
  resources :topics, except: [:show, :new, :edit]
  get "/:root_id/:id" => "topics#show", as: :show_topic

  scope "/admin" do
    resources :topics, only: [:new, :edit]
    resources :basic_guides, only: [:new]
    resources :faqs, only: [:new]
    resources :guides, only: [:new]
  end

  ActionDispatch::Routing::Translator.translate_from_file('lang/i18n-routes.yml', { :no_prefixes => true })
end
