module JsonSerializers
  class EntitySerializer
    def initialize(object, parent_key = nil)
      @object = object
      @parent_key = parent_key
    end

    def to_json
      serialize
    end

    def serialize
      serialized = to_h

      if parent_key
        serialized = { parent_key  => serialized }
      end

      serialized.to_json
    end

    protected

    def to_h
      raise('not implemented')
    end

    attr_reader :object
    attr_reader :parent_key
  end
end
