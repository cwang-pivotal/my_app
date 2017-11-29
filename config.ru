require 'api_sim'

ENDPOINT_JSON_SCHEMA = {type: "object", properties: {a: {type: "integer"}}}.to_json

app = ApiSim.build_app do
  configure_endpoint 'GET', '/endpoint', 'Hi!', 200, {'X-CUSTOM-HEADER' => 'easy as abc'}, ENDPOINT_JSON_SCHEMA

  configure_dynamic_endpoint 'GET', '/api/v1/msp-promo-offers/XHJ18', ->(req) {
    [201, {'X-CUSTOM-HEADER' => '123'}, {
        logo_url: 'http://www.example.com/my_logo.png',
        application_configuation: {
            mode: '1_page',
            fields: ['first_name', 'last_name', 'income'],
        }
    }.to_json]
  }
end

run app