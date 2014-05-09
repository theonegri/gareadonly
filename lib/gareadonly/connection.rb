require "google/api_client"
require "google/api_client/client_secrets"
require "google/api_client/auth/installed_app"
require "OAuth2"

module GAReadonly
  class Connection
    def initialize
      GAReadonly.configuration.client = Google::APIClient.new(:application_name => GAReadonly.configuration.application_name,:application_version => GAReadonly.configuration.application_version)
      GAReadonly.configuration.signing_key = Google::APIClient::KeyUtils.load_from_pkcs12(GAReadonly.configuration.key, 'notasecret')
      GAReadonly.configuration.client.authorization = Signet::OAuth2::Client.new(:token_credential_uri => GAReadonly.configuration.google_url,
      :audience => GAReadonly.configuration.google_url,
      :scope => GAReadonly.configuration.api_scope,
      issuer: GAReadonly.configuration.issuer, 
      signing_key: GAReadonly.configuration.signing_key)
      GAReadonly.configuration.client.authorization.fetch_access_token!
      GAReadonly.configuration.analytics = GAReadonly.configuration.client.discovered_api(GAReadonly.configuration.discovered_api_name,GAReadonly.configuration.discovered_api_version)
    end
  end
end