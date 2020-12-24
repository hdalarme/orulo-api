require 'rest-client'
require 'json'

class GetOruloBuildingListService
    def initialize(page)
      @page = page
    end

    def call
      begin
        base_url = "https://www.orulo.com.br/api/v2/buildings?page=#{@page}"
        response = RestClient.get(base_url, headers={Authorization: ENV["ORULO_API_KEY"] }) #params={page: page},
        JSON.parse(response.body)

      rescue RestClient::ExceptionWithResponse => e
        e.response
      end
    end
end