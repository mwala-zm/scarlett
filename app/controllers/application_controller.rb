class ApplicationController < ActionController::API
  include GraphqlDevise::SetUserByToken
  before_action :authenticate_user!
end
