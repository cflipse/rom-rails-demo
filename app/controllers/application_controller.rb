# frozen_string_literal: true

class ApplicationController < ActionController::Base

  helper_method :logged_in?, :current_user

protected

  def current_user
    warden.user
  end

  def logged_in?
    warden.authenticate
  end

  def login_required
    warden.authenticate!
  end

  def warden
    request.env["warden"]
  end

end
