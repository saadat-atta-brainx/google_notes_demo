class NotesController < ApplicationController

  def index
    if params[:search]
      @notes = current_user.notes.activated.search_by_title_or_description(params[:search])
    else
      @notes = current_user.notes.activated.pinned_descending
    end

  end

  def new
    @note = Note.new
  end

  def show
    @note = current_user.notes.activated.find(params[:id])
  end

  def create
    @note = current_user.notes.new(note_params)
    unless @note.save
      render :new
    end
  end

  def edit
    @note = current_user.notes.find(params[:id])
  end

  def update
    @note = current_user.notes.activated.find(params[:id])
    unless @note.update(note_params)
      render :edit
    end
  end

  def pinned
    toggled_pin = params[:pinned].to_s == 'true' ? false : true
    @note = current_user.notes.activated.find(params[:id])
    @note.update!(is_pinned: toggled_pin)
    render json: @note
  end

  def destroy
    @note = current_user.notes.activated.find(params[:id])
    @note.update(status: false)
    redirect_to notes_path
  end

  # TODO: We can use shared
  def shared_with_me
    #@notes = Note.includes(:shares).where(shares: { user_id: current_user.id })
    @notes = current_user.shared_notes
  end

  def delete_image_attachment
    @note = current_user.notes.activated.find(params[:id])
    @note.images.find_by(params[:attachment_id]).purge
    redirect_to @note
  end

  private

  def note_params
    params.require(:note).permit(:title, :description, :background_color, images: [])
  end

end
