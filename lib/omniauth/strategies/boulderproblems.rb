require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Boulderproblems < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = :public

      option :client_options, {
        :site => 'http://boulderproblems.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }

      option :callback_url
      
      option :provider_ignores_state, true

      def authorize_params
        super.tap do |params|
          params[:scope] ||= DEFAULT_SCOPE
        end
      end

      def callback_url
        options.callback_url || super
      end
    end
  end
end
