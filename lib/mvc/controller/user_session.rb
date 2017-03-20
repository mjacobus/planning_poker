module Mvc
  module Controller
    module UserSession
      def self.included(base)
        base.class_eval do
          expose :user_session
        end
      end

      def user_session
        @user_session ||= UserSessionService.new(session)
      end
    end
  end
end
