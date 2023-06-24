OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.config.facebook_appid, Rails.application.config.facebook_appsecret
end
