class LabelsController < ApplicationController

	def index
		@labels = Api.labels
	end

	def create
		
	end

end