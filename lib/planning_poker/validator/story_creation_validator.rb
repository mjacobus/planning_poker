class StoryCreationValidator < Validator
  def perform_validation(values)
    name = values[:name]

    unless NameValidator.new.valid?(name)
      add_error('Invalid name')
    end
  end
end
