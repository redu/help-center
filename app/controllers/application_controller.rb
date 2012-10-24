class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == USER_ID && password == PASSWORD
    end
  end

  private

  def search
    @search = Topic.search do
      fulltext params[:search]
      order_by(:view_count, :desc)
    end
  end
end
