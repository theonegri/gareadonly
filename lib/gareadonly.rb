require "rubygems"
require 'json'
require 'ostruct'

require "GAReadonly/version"
require "GAReadonly/configuration"
require "GAReadonly/connection"
require "GAReadonly/debug"

module GAReadonly
  LOG_PREFIX = "** [GAReadonly] "

  class << self
    # Configure the GAReadonly notifier application-wide settings.
    def configure(config_hash=nil)
      if config_hash
        config_hash.each do |k,v|
          configuration.send("#{k}=", v) rescue nil if configuration.respond_to?("#{k}=")
        end
      end

      yield(configuration) if block_given?
    end

    # Connect to the GA API
    def connect
      Connection.new
    end

    # Debug logs
    def debug(message)
      Debug.new("#{LOG_PREFIX}#{message}") if configuration.debug
    end

    # Configuration getters
    def configuration
      @configuration ||= GAReadonly::Configuration.new
    end

    def get_analytics_data(options = {})
      #TODO: check the return co and use the debug when return code says so
      options = options.merge({'ids' => GAReadonly.configuration.id })
      data = GAReadonly.configuration.client.execute(:api_method => GAReadonly.configuration.analytics.data.ga.get,:parameters => options)
      return OpenStruct.new(JSON.parse data.body)
    end
  end
end
