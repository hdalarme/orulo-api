module Api::V1

  class ApiController < ApplicationController  
    # Métodos globais
    include DeviseTokenAuth::Concerns::SetUserByToken
  end
  
end