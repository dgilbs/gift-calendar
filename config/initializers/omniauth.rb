OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 1608871576095392, '34850da60b947c0a70dd9499b45e1c5f'
end