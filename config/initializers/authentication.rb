# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"],
    hd: "devcaffeine.com"
end

Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :omniauth
  manager.failure_app = ->(env) { SessionsController.action(:new).call(env) }

  manager.serialize_into_session do |user|
    [user.provider, user.uid, user.info]
  end

  manager.serialize_from_session do |data|
    OpenStruct.new(data.last)
  end
end

Warden::Strategies.add(:omniauth) do
  def omniauth
    request.env["omniauth.auth"]
  end

  def valid?
    omniauth.present?
  end

  # rubocop:disable Style/SignalException
  #   fail has been overriden with a specific, non-exception meaning for warden
  def authenticate!
    if omniauth.info.email.blank?
      fail "no email found!"
    elsif !omniauth.info.email.match?(/@devcaffeine.com$/)
      fail "not authorized for your domain!"
    else
      success! omniauth
    end
  end
  # rubocop:enable Style/SignalException
end
