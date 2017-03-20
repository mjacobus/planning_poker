class UserService
  def initialize(repository = UserRepository.new)
    @repository = repository
  end

  def create_by_name(new_username)
    NameValidator.new.validate!(new_username)
    @repository.create(name: new_username)
  end
end
