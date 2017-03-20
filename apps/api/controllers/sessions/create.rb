module Api::Controllers::Sessions
  class Create
    include Api::Action

    def call(params)
      begin
        username = params[:user][:name]
        user = UserService.new.create_by_name(username)
        user_session.login(user)
        json_response({id: user.id, name: user.name})
      rescue Exception  => e
        json_response({ message: e.message }, 422)
      end
    end
  end
end
