class HeroPowersController < ApplicationController
    def create
        hero_power = HeroPower.create(hero_power_params)
        if hero_power.valid?
            render json: hero_power.hero.as_json(
                except: excluded_attributes,
                include: {powers: {except: excluded_attributes}}
            )
        else
            render json: {errors: hero_power.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def excluded_attributes
        [:created_at, :updated_at]
    end

    def hero_power_params
        params.require(:hero_power).permit(:strength, :hero_id, :power_id)
    end
end
