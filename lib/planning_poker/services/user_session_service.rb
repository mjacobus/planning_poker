class UserSessionService
  def initialize(session, user_service = UserService.new)
    @current_user = nil
    @session = session
    @user_service = user_service
  end

  def login(user)
    @session[:user_id] = user.id
  end

  def logout
    @session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    @session[:user_id].to_i > 0
  end

  def current_user
    if user_id
      @current_user || @user_service.find_by_id(user_id)
    end
  end

  protected

  def user_id
    id = @session[:user_id].to_i
    return nil unless id > 0
    id
  end
end
