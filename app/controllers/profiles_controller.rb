class ProfilesController < ApplicationController

    def new
        @profile = Profile.new
    end
    
    def edit
        @profile = Profile.find(params[:id])
    end
    
    def show
        @profile = Profile.find_by_user_id(params[:user_id])
        @type = User.find(@profile.user_id).type
        if @type == "Shelter" # get pets
            @pets = Pet.all.where("shelter_id=?", @profile.user_id)
        end 
    end

    def update
        @profile = Profile.find(params[:id])
        if @profile.update(params.require(:profile).permit(:name, :location, :phone_number, :description, :profile_pic))
            redirect_to view_profile_url(@profile.user_id), notice: 'Profile was successfully updated.'
        else
            flash.now[:alert] = 'Error! Unable to update profile.' 
            render :edit 
        end
    end

    def delete_profile_pic
        @profile = Profile.find_by_user_id(current_user.id)
        puts @profile.name
        @pic = @profile.profile_pic
        @pic.purge
        if @pic != nil
            redirect_to view_profile_url(@profile.user_id), notice: 'Profile picture successfully removed.'
        else
            redirect_to view_profile_url(@profile.user_id), notice: 'Profile picture non-existent.'
        end
    end
 end