class PagesController < ApplicationController

  def home
    # Check if user is logged in, redirect if not 
    if !current_user
      redirect_to new_user_session_path
    elsif current_user.type == 'Shelter'
      redirect_to view_profile_path(current_user.id)
    # if there was a pet being viewed that has not been rated--pull up that pet
    elsif !session[:current_pet_id].nil? 
      @pet = Pet.get_pet(session[:current_pet_id])
    # Otherwise get a new pet
    else
      # Get pet to view
      @pet = Pet.get_next(current_user.id) 
      # Check if there's a pet left
      if @pet == nil      
        redirect_to adopters_matching_path, alert: 'There are no more pets to rate' 
      else # only add pet to session if one was found
        session[:current_pet_id] = @pet.id
      end
    end
    # renders home.html.erb
  end

  def rate
    begin 
      # Approved is set to nil (not yet decided), viewed is set to false (as it hasn't been viewed),
      # Postive and the id's are set to the values corresponding to the rating being created. 
      @rating = Rating.new(positive: params[:positive], viewed: false, approved: nil,
        pet: Pet.find(params[:pet_id]), adopter: Adopter.find(params[:adopter_id]))
      if @rating.save
        session[:current_pet_id] = nil # Delete pet from session allowing pet to cycle
        redirect_to home_path #, notice: 'DEBUG: Rating was applied'
      else
        raise 'Rating failed'
      end
    rescue StandardError => e
      redirect_to home_path, alert: "Error: #{e.inspect}"
    end
  end

end
