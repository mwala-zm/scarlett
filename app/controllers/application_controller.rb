class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include GraphqlDevise::SetUserByToken

  protect_from_forgery
  def after_confirmation_path
  end
end
