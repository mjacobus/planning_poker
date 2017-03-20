require_relative '../../../../apps/web/views/sessions/new'

RSpec.describe Web::Views::Sessions::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/sessions/new.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'

    # Example
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
