RSpec::Matchers.define :have_response_status do |expected|
  match do |response|
    response[0] == expected
  end

  description { "to have status code #{expected}" }
end

RSpec::Matchers.define :have_json_body do |expected|
  match do |response|
    response = response[2][0]
    as_hash = JSON.parse(response, symbolize_names: true)

    if expected.class == String
      expected = JSON.parse(response, symbolize_names: true)
    end

    as_hash == expected
  end

  description { "to have json body #{expected}" }
end

RSpec::Matchers.define :be_json do
  match do |response|
    expected =  'application/json; charset=utf-8'
    actual = response[1]["Content-Type"]
    actual == expected
  end

  description { "to have 'Content-Type' 'application/json charset=utf-8'" }
end
