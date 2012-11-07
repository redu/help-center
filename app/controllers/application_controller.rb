class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :set_locale_from_url

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == USER_ID && password == PASSWORD
    end
  end

  private

  def searching
    @search = Topic.search do
      fulltext params[:search]
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
    I18n.locale = params[:locale] || ((lang = request.env['HTTP_ACCEPT_LANGUAGE']) && lang[/^[a-z]{2}/])
  end
end
