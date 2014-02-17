class LabelsController < ApplicationController

	def index
		@labels = Label.list
	end

	def create

	end

end