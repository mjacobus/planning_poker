class UserService
  UserNotFound = Class.new(DomainError)

  def initialize(repository = UserRepository.new)
    @repository = repository
  end

  def create_by_name(new_username)
    NameValidator.new.validate(new_username)
    @repository.create(name: new_username)
  end

  def find_by_id(user_id)
    @repository.find(user_id) || fail(UserNotFound)
  end
end
