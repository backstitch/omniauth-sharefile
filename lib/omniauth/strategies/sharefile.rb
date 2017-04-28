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
        :site          => 'https://api.sharefile.com/https/oauth2.aspx',
        :authorize_url => 'https://secure.sharefile.com/oauth/authorize',
        :token_url     => 'https://secure.sharefile.com/oauth/token',
      }

      # uid { raw_info["user"]["id"] }
      #
      # info do
      #   {
      #     :email    => raw_info["user"]["email"],
      #     :name     => raw_info["user"]["display_name"],
      #     :nickname => raw_info["user"]["username"],
      #     :image    => raw_info["user"]["avatar"]
      #   }
      # end

      extra { raw_info }

      def raw_info
        Rails.logger.info @raw_info

        @raw_info ||= {}
      end

    end
  end
end
