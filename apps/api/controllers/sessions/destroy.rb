module Api::Controllers::Sessions
  class Destroy
    include Api::Action

    def call(params)
      user_session.logout
      json_response({ message: :OK })
    end
  end
end
