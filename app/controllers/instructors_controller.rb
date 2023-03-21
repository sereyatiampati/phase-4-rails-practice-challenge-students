class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry

  # GET /instructors
  def index
    @instructors = Instructor.all

    render json: @instructors
  end

  # GET /instructors/1
  def show
    render json: @instructor
  end

  # POST /instructors
  def create
    @instructor = Instructor.new(instructor_params)

    @instructor.save!
      render json: @instructor, status: :created
  end

  # PATCH/PUT /instructors/1
  def update
     @instructor.update!(instructor_params)
      render json: @instructor
  end

  # DELETE /instructors/1
  def destroy
    @instructor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instructor_params
      params.permit(:name)
    end

    def record_not_found
      render json: {error: "Instructor not found!"}, status: :unprocessable_entity
    end

    def invalid_entry(invalid)
      render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end
end
