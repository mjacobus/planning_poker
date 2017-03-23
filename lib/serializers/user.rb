class UserSerializer < EntitySerializer
  protected

  def to_h
    {
      id: object.id,
      name: object.name,
    }
  end
end
