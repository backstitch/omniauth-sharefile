require 'omniauth/strategies/oauth2'
require 'base64'
require 'openssl'
require 'rack/utils'
require 'uri'

module OmniAuth
  module Strategies
    class Sharefile < OmniAuth::Strategies::OAuth2

      option :name, :sharefile

      option :client_options, {
        :site          => 'https://secure.sharefile.com/oauth/authorize',
        :authorize_url => 'https://secure.sharefile.com/oauth/authorize',
        :token_url     => 'https://secure.sharefile.com/oauth/token',
      }


      uid { raw_info["Id"] }

      info do
        {
          :email    => raw_info["Email"],
          :first_name => raw_info["FirstName"],
          :last_name => raw_info["LastName"],
          :name     => raw_info["FullName"],
          :nickname => raw_info["FullName"]
        }
      end

      extra { raw_info }

      def raw_info
        @raw_info ||= access_token.get("https://#{request.params['subdomain']}.sf-api.com/sf/v3/Users").parsed
      end

    end
  end
end
