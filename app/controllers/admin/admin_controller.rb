module Admin
  class AdminController < ApplicationController
    before_action :authenticate

    def authenticate
      authenticate_or_request_with_http_basic('Administration') do |user, password|
        user == "admin" && password == ENV.fetch("ADMIN_PASSWORD", "password")
      end
    end
  end
end
