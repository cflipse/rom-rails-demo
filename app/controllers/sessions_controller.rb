# frozen_string_literal: true

class SessionsController < ApplicationController

  protect_from_forgery except: "create"

  def create
    warden.authenticate!
    redirect_to "/"
  end

  def destroy
    warden.logout
    redirect_to "/"
  end

end
