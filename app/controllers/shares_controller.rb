class SharesController < ApplicationController

  def index
    # TODO: we don't need to assign current_user to instance variable, because current_user is already a helper function
    @user = current_user
    @note = Note.find(params[:note_id])
    @share = Share.new
  end

  def create
    input_email = params[:share][:email]
    # TODO: only use instace variable if we need them in View
    @user = User.find_by(email: input_email)
    if @user
      # TODO: use COC when passing params to Model
      @share = Share.new(note_id: params[:note_id], user_id: @user.id)
      unless @share.save
        # TODO: use generic noun instead of notfound, like alert or error
        flash[:notfound] = 'Already added to note sharing list.'
        redirect_to notes_path
      end
    else
      flash[:notfound] = "User with email #{input_email} not found."
      redirect_to notes_path
    end
  end

  # TODO: Use Destroy method to delete record
  def delete_shared_note
    userId = params[:user_id] ? params[:user_id] : current_user.id
    @note = Note.find(params[:note_id])
    @share = @note.shares.find_by(user_id: userId)
    @share.destroy
    redirect_to shared_with_me_notes_path
  end

  # TODO: Share doesn't have to deal with users search.
  def get_users
    @users = User.search_key(params[:q])
    render json: @users
  end

end
