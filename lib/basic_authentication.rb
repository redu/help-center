require 'active_support/core_ext'

class BasicAuthentication
  ENABLED = false
  USERNAME, PASSWORD = 'admin', 'admin'
  cattr_accessor :enabled, :username, :password
end
