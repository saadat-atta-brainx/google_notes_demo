class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

end
