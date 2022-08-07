class RegistrationsController < Devise::RegistrationsController
    def create
        super 
        if resource.save
            @profile = Profile.new
            @profile.user_id = resource.id
            @profile.email = resource.email
            @profile.name = resource.name
            @profile.phone_number = resource.phone_number
            @profile.save
        end
      end
    
      def destroy
        super
        if resource.destroy
            @profile = Profile.find(user_id: resource.id)
            @profile.destroy
        end
      end
    
    private

    def sign_up_params
        params.require(:user).permit(:email,:password, :password_confirmation, :type, :name, :phone_number)
    end
  
    def account_update_params
        params.require(:user).permit(:email,:password, :password_confirmation, :type, :name, :phone_number)
    end
end