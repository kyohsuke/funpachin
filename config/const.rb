require 'yaml'

module Const
  RAILS_ROOT = File.expand_path("#{File.dirname(__FILE__)}/../")
  RAILS_ENV = (ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development')

  unless defined?(::Rails)
    module ::Rails
      class << self
        def root; RAILS_ROOT; end
        def env; RAILS_ENV; end
      end
    end
  end

  module ::Rails
    class << self
      def env?(*value)
        if block_given?
          yield if value.include?(RAILS_ENV.to_sym)
        else
          return value.include?(RAILS_ENV.to_sym)
        end
      end
    end
  end

  
  All = YAML.load(File.read("#{RAILS_ROOT}/config/constant.yml")).freeze

  module Twitter
    Token = All[Rails.env]['twitter']['token']
    Secret = All[Rails.env]['twitter']['secret']
  end
end
