class PetsController < ApplicationController
    def new
        @pet = Pet.new
    end
    
    def edit
        @pet = Pet.find(params[:id])
    end
    
    def show
        @pet = Pet.find(params[:pet_id])
    end

    def update
        @pet = Pet.find(params[:id])
        if @pet.update(params.require(:pet).permit(:breed, :date_of_birth, :description, :name, :price, :species, pet_pics: []))
            redirect_to view_pet_url(@pet.id), notice: 'Pet was successfully updated.'
        else
            flash.now[:alert] = 'Error! Unable to update pet.' 
            render :edit 
        end
    end
    
    def create # This should really be in the pets controller
        @pet = Pet.new(params.require(:pet_id).permit(:breed, :date_of_birth, :description, :name, :price, :species, pet_pics: []))
        if @pet.save
            redirect_to edit_shelter_url(@pet), notice: 'Pet successfully created.'
        else
            flash.now[:alert] = 'Error! Unable to create pet entry.'
            render :new
        end
    end

    def delete_pet_pics
        @pet = Pet.find(params[:format])
        @album = @pet.pet_pics
        @album.purge
        if @album != nil
            redirect_to view_pet_url(@pet.id), notice: 'Pet pictures successfully removed.'
        else
            redirect_to view_pet_url(@pet.id), notice: 'Pet pictures non-existent.'
        end
    end
end
