Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Const::Twitter::Token, Const::Twitter::Secret
end
