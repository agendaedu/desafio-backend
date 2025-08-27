require_relative './controller_macros' # or require_relative './controller_macros' if write in `spec/support/devise.rb`

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
end