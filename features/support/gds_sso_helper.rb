require "warden/test/helpers"

module GdsSsoHelper
  include Warden::Test::Helpers
  Warden.test_mode!

  def login_as(user)
    puts "#{ENV['TEST_ENV_NUMBER']}-#{Process.pid} BEFORE:     GDS::SSO.test_user: #{GDS::SSO.test_user.id} #{GDS::SSO.test_user.permissions.inspect}" if GDS::SSO.test_user.present?
    GDS::SSO.test_user = user
    Edition::AuditTrail.whodunnit = user
    puts "#{ENV['TEST_ENV_NUMBER']}-#{Process.pid} LOGIN:      GDS::SSO.test_user: #{GDS::SSO.test_user.id} #{GDS::SSO.test_user.permissions.inspect}"
    super(user) # warden
  end

  def log_out
    GDS::SSO.test_user = nil
    Edition::AuditTrail.whodunnit = nil
    logout # warden
  end

  def as_user(user)
    original_user = GDS::SSO.test_user
    login_as(user)
    yield
    login_as(original_user)
  end
end

World(GdsSsoHelper)

After do
  log_out
  Warden.test_reset!
end
