require 'sinatra/base'

module Sinatra
  module AppSession
    attr_accessor :store

    class Store
      attr_accessor :namespaces

      def initialize
        @namespaces ||= {}
      end

      def set namespace, name, val
        @namespaces[namespace.to_sym] ||= {}
        @namespaces[namespace.to_sym][name.to_sym] = val
      end

      def get namespace, name
        @namespaces[namespace.to_sym] ||= {}
        @namespaces[namespace.to_sym][name.to_sym]
      end
    end

    def self.session
      @session ||= {}
    end
    
    def self.session=(val)
      @session = val.clone

      rescue TypeError
        @session = nil
    end

    def self.logged?; get_user; end;
    
    def self.logout; self.user = {}; end;
    def self.set_user user; self.user.set :global, :user_obj, user; end;
    def self.get_user; self.user.get :global, :user_obj; end;

    def self.init_store name
      session[:stores] ||= {}
      session[:stores][name.to_sym] ||= Store.new
    end

    def self.method_missing name, *args; init_store name; end
    def session; AppSession.session; end;
  end
  
  helpers AppSession
end