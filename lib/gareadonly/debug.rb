module GAReadonly
  class Debug
    def initialize
      Rails.logger.debug "My debugging message"
    end
  end
end