# frozen_string_literal: true

module Megafono
  module Domain
    MAIN_DOMAIN = ENV.fetch("MEGAFONO_DOMAIN", "megafono.host")

    def self.protocol
      @protocol ||= env == "test" ? "http" : "https"
    end

    def self.domain
      if test?
        `/sbin/ip route|awk "/scope/ { print $9 }"`.strip
      else
        Megafono::Domain::MAIN_DOMAIN
      end
    end

    def self.call(service)
      if test?
        require "capybara"
        "#{domain}:#{::Capybara.server_port}/#{service}"
      elsif service == "site"
        "#{development? ? "dev-" : ""}megafono.#{service}"
      elsif service == "link"
        "#{development? ? "dev-" : ""}mgfn.#{service}"
      else
        "#{service}.#{domain}"
      end
    end

    def self.route_setup(service)
      if test?
        { at: "/#{service}" }
      elsif service == "site"
        { at: "/", constraints: { host: %r{.*.site} } }
      else
        { at: "/", constraints: { host: self.(service) } }
      end
    end

    def self.test?
      env == "test"
    end

    def self.development?
      env == "development"
    end

    def self.env
      @env || ENV.fetch("RAILS_ENV", "production")
    end

    def self.env=(env)
      @env = env
    end
  end
end
