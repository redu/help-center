HelpCenter::Application.routes.draw do

  match 'help_central/' => 'help_central#index', :as => :help_central_index
  match 'help_central/faq' => 'help_central#faq', :as => :help_central_faq
  match 'help_central/faq/category' => 'help_central#faq_category', :as => :help_central_faq_category
  match 'help_central/guide/basic' => 'help_central#guide_basic', :as => :help_central_guide_basic
  match 'help_central/guide/student' => 'help_central#guide_student', :as => :help_central_guide_student
  match 'help_central/guide/teacher' => 'help_central#guide_teacher', :as => :help_central_guide_teacher
  match 'help_central/guide/manager' => 'help_central#guide_manager', :as => :help_central_guide_manager
  match 'help_central/guide/developer' => 'help_central#guide_developer', :as => :help_central_guide_developer
  match 'help_central/article' => 'help_central#article', :as => :help_central_article
  match 'help_central/search' => 'help_central#search', :as => :help_central_search
  match 'help_central/search/empty' => 'help_central#search_empty', :as => :help_central_search_empty

  # The priority is based upon order of creation:
  # first created -> highest priority.

  root to: "topics#index"

  match "search" => "topics#search"

  resources :topics, except: [:new, :edit]
  resources :basic_guides, only: [:show, :create, :update]
  resources :faqs, only: [:show, :create, :update]
  resources :guides, only: [:show, :create, :update]

  scope "/admin" do
    resources :topics, only: [:new, :edit]
    resources :basic_guides, only: [:new]
    resources :faqs, only: [:new]
    resources :guides, only: [:new]
  end

  ActionDispatch::Routing::Translator.translate_from_file('lang/i18n-routes.yml')
end
