require_relative './validator'

class NameValidator < Validator
  protected

  def perform_validation(value)
    if value.to_s.strip == ''
      add_error('Name cannot be empty')
    end
  end
end
