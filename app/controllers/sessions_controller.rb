# frozen_string_literal: true

class SessionsController < ApplicationController

  protect_from_forgery except: "create"

  def create
    @auth = request.env["omniauth.auth"].to_h
  end

end
