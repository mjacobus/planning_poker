module Mvc
  module Controller
    module SkipCsrfVerification
      def verify_csrf_token?
        false
      end
    end
  end
end
