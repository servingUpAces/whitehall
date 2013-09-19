GDS::SSO.config do |config|
  config.user_model   = "User"
  config.oauth_id     = 'abcdefghjasndjkasndwhitehall'
  config.oauth_secret = 'secret'
  config.oauth_root_url = Plek.current.find("signon")
  config.basic_auth_user = 'api'
  config.basic_auth_password = 'defined_on_rollout_not'
end

module GDS
  module SSO
    def self.test_user=(usr)
      puts "SETTING test_user! - #{Process.pid}/#{Thread.current.object_id}"
      @@test_user = usr
    end
  end
end
