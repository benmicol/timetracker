class ProjectsController < ApplicationController
	def index
		@entries = Entry.all
	end

	def new
		@entry = Entry.new
	end

	def create
		@entry = Entry.new(entry_params)
		if @entry.save
			redirect_to root_path, notice: "Entry created!"
		else
			render :new
		end
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:id])

		if @entry.update(entry_params)
			redirect_to root_path, notice: "Entry updated!"
		else
			render :edit
		end
	end

	private

	def entry_params
		params.require(:entry).permit(:date, :time, :archived)
	end
end