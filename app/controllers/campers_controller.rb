class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_camper_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_camper_response

    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        camper = Camper.find_by!(id: params[:id])
        render json: camper, include: :activities
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

private

    def render_camper_not_found_response
        render json: { error: "Camper not found"}, status: :not_found
    end

    def render_invalid_camper_response(invalid)
        # byebug
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def camper_params
        params.permit(:name, :age)
    end

end
