module GAReadonly
  class Configuration
    attr_accessor :api_scope
    attr_accessor :application_name
    attr_accessor :application_version
    attr_accessor :key
    attr_accessor :signing_key
    attr_accessor :issuer
    attr_accessor :id
    attr_accessor :client
    attr_accessor :analytics
    attr_accessor :discovered_api_name
    attr_accessor :discovered_api_version
    attr_accessor :google_url
    attr_accessor :debug

    API_SCOPE = "https://www.googleapis.com/auth/analytics.readonly"
    ANALYTICS = 'analytics'
    VERSION = 'v3'
    GOOGLE_URL = "https://accounts.google.com/o/oauth2/token"

    def initialize
      # Set up the defaults
      self.api_scope = API_SCOPE
      self.discovered_api_name = ANALYTICS
      self.discovered_api_version = VERSION
      self.analytics = ""
      self.client = ""
      self.google_url = GOOGLE_URL
      self.signing_key = ""
    end
  end
end
