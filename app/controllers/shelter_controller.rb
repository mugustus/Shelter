class ShelterController < ApplicationController
  
  def matching
    if !current_user
      redirect_to new_user_session_path
    else
      # get all relevant adopters
      @ratings = Rating.get_positive(current_user.id)
      # renders matching.html.erb
    end
  end

  def approve
    @rating = Rating.find(params[:rating_id])
    @rating.update(approved: params[:approved])
    if @rating.save
      redirect_to shelter_matching_path #, notice: 'DEBUG: Approval was applied'
    else
      flash.now[:alert] = 'Rating failed'
      render :home
    end
  end

end

