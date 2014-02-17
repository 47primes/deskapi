class LabelsController < ApplicationController

	def index
		@labels = Label.list["_embedded"]["entries"].sort_by {|label| label["name"]}
		@cases = [nil] + Case.list["_embedded"]["entries"].map {|entry| [entry["subject"], entry["id"]]}
	end

	def create
		response = params[:case_id].blank? ? Label.create(params) : Case.append_label(params[:case_id], params[:name])
		redirect_to labels_path, :notice => response.code =~ /20\d/ ? "Created label #{params[:name]}" : "Unable to create label #{params[:name]}"
	end

end