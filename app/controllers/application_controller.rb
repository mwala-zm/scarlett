class ApplicationController < ActionController::API
  include GraphqlDevise::SetUserByToken

  def current_user
    token = request.headers["Authorization"].to_s
    User.find_for_database_authentication(authentication_token: token)
  end

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: current_user,
    }
    result = HabitTrackerSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end
end
