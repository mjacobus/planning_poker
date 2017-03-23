module JsonSerializers
  class User < EntitySerializer
    protected

    def to_h
      {
        id: object.id,
        name: object.name,
      }
    end
  end
end
