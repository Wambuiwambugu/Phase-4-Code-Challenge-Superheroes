class PowersController < ApplicationController
    def index
        powers = Power.all
        render json: powers, except: excluded_attributes, status: :ok
    end

    def show
        power = find_by_id
        if power
            render json: power, except: excluded_attributes, status: :ok
        else
            render_not_found
        end
    end

    def update
        power = find_by_id
        if power
            power.update(description: params[:description])
            if power.valid?
                render json: power, except: excluded_attributes, status: :ok
            else
                render json: {error: power.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render_not_found
        end
    end

    private
    def find_by_id
        Power.find_by(id: params[:id])
    end

    def excluded_attributes
        [:created_at, :updated_at]
    end

    def render_not_found
        render json: {error: "Power not found"}, status: :not_found
    end
end
