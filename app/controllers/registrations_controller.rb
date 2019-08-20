class RegistrationsController < Devise::RegistrationsController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        # render plain: params[:user].inspect
        if(@user.save)
            redirect_to :new_user_session
        else
            render 'new'
        end
    end

    private

    def user_params
        # devise_parameter_sanitizer.for(:sign_up){|u|u.permit(:email,:password,:password_confirmation)}
        params.require(:user).permit(:username,:email,:password,:password_confirmation)
    end


end
