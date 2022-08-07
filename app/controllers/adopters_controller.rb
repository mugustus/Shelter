class AdoptersController < ApplicationController
  def matching
    if !current_user
      redirect_to new_user_session_path
    elsif Rating.get_new_matches_count(current_user.id) > 0
      redirect_to adopters_notify_path
    else
      # get all relevant adopters
      @ratings = Rating.get_matches(current_user.id)
      # renders matching.html.erb
    end
  end

  def notify
    @match = Rating.get_new_match(current_user.id)
    @user = Profile.find_by_user_id(current_user.id)
    # renders notify.html.erb
  end

  def continue
    puts '============Continue called'
    rating = Rating.find(params[:rating_id])
    rating.update(viewed: true)
    puts rating.viewed
    redirect_to adopters_matching_path
  end
end
