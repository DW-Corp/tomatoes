module Api
  class SessionsController < BaseController
    def create
      auth_provider = AuthFactory.build(params)
      user = auth_provider.find_user
      user = auth_provider.create_user! unless user

      tomatoes_auth = user.authorizations.build(provider: 'tomatoes')
      tomatoes_auth.generate_token
      tomatoes_auth.save!

      render json: { token: tomatoes_auth.token }
    rescue Error::ProviderNotSupported
      bad_request 'provider not supported'
    rescue Error::Unauthorized
      unauthorized 'authentication failed'
    end
  end
end