class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry

private

def record_not_found
    render json: {error: "Record not found!"}
end

def invalid_entry(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
end

end
