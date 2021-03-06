# frozen_string_literal: true
module Api::Controllers::Sessions
  class Create
    include Api::Action

    def call(params)
      username = params[:user][:name]
      user = UserService.new.create_by_name(username)
      user_session.login(user)
      json_response(UserSerializer.new(user, :user))
    rescue Exception => e
      json_response(ExceptionSerializer.new(e), 422)
    end
  end
end
