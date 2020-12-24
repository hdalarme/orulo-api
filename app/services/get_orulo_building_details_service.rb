require 'rest-client'
require 'json'

class GetOruloBuildingDetailsService
  def initialize(buildingId)
    @buildingId = buildingId
  end

  def call
    begin
      base_url = "https://www.orulo.com.br/api/v2/buildings/#{@buildingId}"
      response = RestClient.get(base_url, headers={Authorization: ENV["ORULO_API_KEY"] })
      value = JSON.parse(response.body)

    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end