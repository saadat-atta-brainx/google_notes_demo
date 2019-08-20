class SessionsController < Devise::SessionsController

    def create
        user = User.find_for_authentication(params[:user][:email])
        render plain: params[:user].inspect
    end
end
