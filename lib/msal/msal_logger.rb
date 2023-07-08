# frozen_string_literal: true

require 'logger'

module ::Msal
  # Log application activity
  class MsalLogger
    DEFAULT_LOG_LEVEL = ::Logger::INFO
    def initialize(filename = $stdout, options = { level: })
      @logger = ::Logger.new(filename, level: options[:level] || DEFAULT_LOG_LEVEL)

      @logger.formatter = proc do |severity, time, progname, message|
        ::Logger::Formatter.new.call(severity, time, progname, message.dump)
      end
    end

    def info(message)
      @logger.info(message)
    end

    def debug(message)
      @logger.info(message)
    end

    def level
      @logger.level
    end
  end
end
