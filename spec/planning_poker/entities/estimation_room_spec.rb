RSpec.describe EstimationRoom do
  subject { EstimationRoom.new }

  %w(
    id
    name
    description
    admin_uuid
    voting_uuid
    created_at
    updated_at
  ).each do |attribute|
    it "has getter for #{attribute}" do
      expect(subject).to respond_to(attribute)
    end
  end
end
