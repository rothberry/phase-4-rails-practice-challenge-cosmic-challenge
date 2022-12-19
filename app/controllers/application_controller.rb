class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  private

  def render_not_found(err)
    # err.record.id
    debugger
    render json: { error: err.message }, status: :not_found
  end

  def render_invalid(err)
    render json: { error: err.record.errors.full_messages }, status: :unprocessable_entity
  end
end
