class HeroesController < ApplicationController
    def index
        heroes = Hero.all
        render json: heroes, except: excluded_attributes, status: :ok
    end

    def show
        hero = Hero.find_by(id: params[:id])
        if hero
            render json: hero.as_json(
                except: excluded_attributes,
                include: {powers: {except: excluded_attributes}}
            ), status: :ok
        else
            render json: {error: "Hero not found"}, status: :not_found
        end
    end

    private
    def excluded_attributes
        [:created_at, :updated_at]
    end
end
