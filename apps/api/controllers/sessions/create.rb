module Api::Controllers::Sessions
  class Create
    include Api::Action

    def call(params)
      begin
        username = params[:user][:name]
        user = UserService.new.create_by_name(username)
        user_session.login(user)
        json_response(JsonSerializers::User.new(user, :user))
      rescue Exception  => e
        json_response(JsonSerializers::ExceptionSerializer.new(e), 422)
      end
    end
  end
end
