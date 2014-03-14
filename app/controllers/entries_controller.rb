class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  	@entries = Entry.all
  end

  def show
  	@entry = Entry.find params[:id]
  end

  def new
  	@entry = Entry.new
  end

  def create
  	safe_entry_params=params.require(:entry).permit(:title, :content)
  	@entry = Entry.new(safe_entry_params)
  	@entry.user = current_user

  	if @entry.save
  		redirect_to @entry
  	else
  		render:new
  	end
  end
end
