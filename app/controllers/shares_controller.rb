class SharesController < ApplicationController

  def index
    @note = Note.find(params[:note_id])
    @share = Share.new
  end

  def create
    input_email = params[:share][:email]
    user = User.find_by(email: input_email)
    if user
      @share = Share.new(note_id: params[:note_id], user: user)
      unless @share.save
        flash[:error] = 'Already added to note sharing list.'
        redirect_to notes_path
      end
    else
      flash[:error] = "User with email #{input_email} not found."
      redirect_to notes_path
    end
  end

  def destroy
    @share = Share.find(params[:id])
    @share.destroy
    redirect_to shared_notes_path
  end

  # def delete_shared
  #   @share = Share.find_by(note_id: params[:note_id], user: current_user)
  #   @share.destroy
  #   redirect_to shared_notes_path
  # end

end
