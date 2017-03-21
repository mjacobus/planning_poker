class Validator
  def validate!(value)
    @errors = []
    return if valid?(value)
    fail(ValidationError, error_message)
  end

  def valid?(value)
    perform_validation(value)
    return errors.empty?
  end

  def errors
    @errors ||= []
  end

  protected

  def perform_validation(_value)
    fail('not implemented')
  end

  def error_message
    errors.join(', ')
  end

  def add_error(error)
    errors << error
  end
end
