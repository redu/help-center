module AuthHelper
  def http_login
    config = HelpCenter::Application.config.user
    request.env['HTTP_AUTHORIZATION'] =\
      ActionController::HttpAuthentication::Basic.
        encode_credentials(config[:user_id], config[:user_password])
  end
end

