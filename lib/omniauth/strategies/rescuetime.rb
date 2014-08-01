require 'omniauth/strategies/oauth2'
require 'base64'
require 'openssl'
require 'rack/utils'
require 'uri'

module OmniAuth
  module Strategies
    class Rescuetime < OmniAuth::Strategies::OAuth2

      option :name, :rescuetime

      option :client_options, {
        :site          => 'https://www.rescuetime.com/api/oauth/data/',
        :authorize_url => 'https://www.rescuetime.com/oauth/authorize/',
        :token_url     => 'https://www.rescuetime.com/oauth/token/',
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
        @raw_info# ||= access_token.get("https://api.cloudsdale.org/v2/me.json").parsed
      end

    end
  end
end