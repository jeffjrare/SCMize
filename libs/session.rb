require 'sinatra/base'

module Sinatra
  module AppSession

    def self.session
      @session ||= {}
    end
    
    def self.session=(val)
      @session = val.clone
    rescue TypeError   # Nil doesn't respond to clone
      @session = nil
    end

    def self.prepare
      session[:filtering] ||= {}
      session[:view] ||= {}
      session[:user] ||= { :object => nil }
    end

    def self.logged?
      prepare
      get_user
    end
    
    def self.logout
      session[:user] = { :object => nil }
    end

    def self.set_user user
      prepare
      session[:user][:object] = user
    end

    def self.get_user
      prepare
      session[:user][:object]
    end

    module Filtering
      def self.set page, filtering
        AppSession.prepare
        AppSession.session[:filtering][page.to_sym] = filtering.to_s
      end

      def self.get page
        AppSession.prepare
        AppSession.session[:filtering][page.to_sym]
      end
    end

    module View
      def self.set page, view
        AppSession.prepare
        AppSession.session[:view][page.to_sym] = view.to_s
      end

      def self.get page
        AppSession.prepare
        AppSession.session[:view][page.to_sym]
      end
    end
    
    def session
      AppSession.session
    end
  end
  
  helpers AppSession
end