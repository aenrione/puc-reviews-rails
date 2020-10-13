class Api::V1::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  include ApiErrorConcern

  self.responder = ApiResponder

  respond_to :json
end
