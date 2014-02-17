class CasesController < ApplicationController

	def index
		@cases = Case.list
	end

end