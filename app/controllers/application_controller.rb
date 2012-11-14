class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      config = HelpCenter::Application.config.user
      username == config[:user_id] && password == config[:user_password]
    end
  end

  private

  def searching
    @search = Topic.search do
      fulltext params[:termo]
      with(:leaf, true)
    end
  end

  def top_questions
    @top_questions = Topic.search do
      with(:leaf, true)
      with(:parent_faq, true)
      order_by(:view_count, :desc)
      paginate page: 1, per_page: 5
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
