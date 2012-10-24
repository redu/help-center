module AuthHelper
  def http_login
    user = USER_ID
    pw = PASSWORD
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end

