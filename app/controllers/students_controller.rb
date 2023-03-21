class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]
# rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
# rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry

  # GET /students
  def index
    @students = Student.all

    render json: @students
  end

  # GET /students/1
  def show
    render json: @student
  end

  # POST /students
  def create
    student = Student.create!(student_params)

      render json: student, status: :created

  end

  # PATCH/PUT /students/1
  def update
    if @student.update!(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.permit(:name, :major, :age, :instructor_id)
    end

    
end
