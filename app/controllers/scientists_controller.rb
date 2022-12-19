class ScientistsController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  before_action :set_scientist, only: [:show, :update, :destroy]
  # attr_accessor :scientist

  def index
    render json: Scientist.all
  end

  def show_find_by
    scientist = Scientist.find_by(id: params[:id])
    if scientist
      render json: scientist
    else
      render json: { error: "Scientist not found" }, status: :not_found
    end
  end

  def show_find_with_rescue
    begin
      scientist = Scientist.find(params[:id])
      render json: scientist
    rescue ActiveRecord::RecordNotFound => err
      render json: { error: err.message }, status: :not_found
    end
  end

  def show
    # scientist = Scientist.find(params[:id])
    render json: @scientist, serializer: ScientistShowSerializer
  end

  def create_with_new
    # debugger
    # new_scientist = Scientist.new(scientist_params)
    # if new_scientist.save
    new_scientist = Scientist.create(scientist_params)
    if new_scientist.id
      render json: new_scientist, status: :created
    else
      render json: { errors: new_scientist.errors.full_messages }, status: 422
    end
  end

  def create
    new_scientist = Scientist.create!(scientist_params)
    render json: new_scientist, status: :created
  end

  def update
    # scientist = Scientist.find(params[:id])
    @scientist.update!(scientist_params)
    render json: @scientist, status: :accepted
  end
  
  def destroy
    # debugger
    # @scientist.missions.destroy_all
    @scientist.destroy
    head :no_content
  end

  private

  def set_scientist
    @scientist = Scientist.find(params[:id])
  end

  def scientist_params
    params.permit(:name, :field_of_study, :avatar)
  end

  # def render_not_found(err)
  #   render json: { error: err.message }, status: :not_found
  # end
end
