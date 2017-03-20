module Mvc
  module Controller
    module JsonResponse
      def json_response(object, status = 200)
        self.status = status
        self.format = :json
        self.body = object.to_json
      end
    end
  end
end
