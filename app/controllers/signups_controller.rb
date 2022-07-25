class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_signup_response

    def create
        # signup = Signup.create!(signup_params)
        activity = Activity.find_by(id: params[:activity_id])
        activity.signups.create!(signup_params)
        render json: activity, status: :created
    end

private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_invalid_signup_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
