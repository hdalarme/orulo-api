require 'rest-client'
require 'json'

class GetOruloBuildingListService
    def initialize()
    end

    def call
      begin
        base_url = "https://www.orulo.com.br/api/v2/buildings"
        response = RestClient.get(base_url, headers={Authorization: ENV["ORULO_API_KEY"] })
        JSON.parse(response.body)

      rescue RestClient::ExceptionWithResponse => e
        e.response
      end
    end
end