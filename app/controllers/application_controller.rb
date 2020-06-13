class ApplicationController < ActionController::Base
  include ForgeryProtection
  include SetPlatform
  include Pagy::Backend
end
