module TestHelpers
  def self.included(base)
    base.class_eval do
      let(:factory) { TestFactory.new }
    end
  end
end
