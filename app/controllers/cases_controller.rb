class CasesController < ApplicationController

	def index
		@cases = Api.cases
	end

end