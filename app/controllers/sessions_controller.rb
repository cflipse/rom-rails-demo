# frozen_string_literal: true

class SessionsController < ApplicationController

  protect_from_forgery except: "create"

  def new
    flash.now[:alert] = warden.message if warden.message.present?
  end

  def create
    warden.authenticate!
    redirect_to "/"
  end

  def destroy
    warden.logout
    redirect_to "/"
  end

end
