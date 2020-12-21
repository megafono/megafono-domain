module Megafono
  module Domain
    MAIN_DOMAIN = ENV.fetch('MEGAFONO_DOMAIN', 'megafono.host')

    def self.protocol
      @protocol ||= env == 'test' ? 'http' : 'https'
    end

    def self.domain
      case env
      when 'test'
        `/sbin/ip route|awk '/scope/ { print $9 }'`.strip
      else
        Megafono::Domain::MAIN_DOMAIN
      end
    end

    def self.call(service)
      case env
      when 'test'
        "#{domain}:#{Capybara.server_port}/#{service}"
      else
        "#{service}.#{domain}"
      end
    end

    def self.env
      @env || ENV.fetch("RAILS_ENV", 'production')
    end

    def self.env=(env)
      @env = env
    end
  end
end