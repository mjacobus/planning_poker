module JsonSerializers
  class ExceptionSerializer < EntitySerializer
    protected

    def to_h
      { message: object.message }
    end
  end
end
