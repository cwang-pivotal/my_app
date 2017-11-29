require 'spec_helper'

describe '/get_promo' do
  API_HOST = ENV['API_HOST']
  p API_HOST
  response = HTTParty.get "#{API_HOST}/api/get_promo/sdf8902"
  expect(response.code).to eq 200
  expect(JSON.parse(response.body)).to eq (
                                              {
                                                  required_fields: ['first_name', 'last_name']
                                              })
end