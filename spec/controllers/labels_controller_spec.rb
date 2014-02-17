require 'spec_helper'

describe LabelsController do
	describe "GET #index" do
		it "responds successfully with an HTTP 200 status code" do
			get :index

			expect(response).to be_success
      expect(response.status).to eq(200)
		end

		it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the labels into @labels" do
      get :index

      expect(assigns(:labels)).to be_a(Array)
    end

    it "loads all of the cases into @cases" do
      get :index

      expect(assigns(:cases)).to be_a(Array)
    end
	end

	describe "POST to #create" do
		it "creates a label if no case is passed" do
			labels = Label.list["total_entries"]

			post :create, {"name" => "Test Label #{Time.now.to_i}"}

			expect(Label.list["total_entries"]).to eq(labels + 1)
		end

		it "appends a label to a case" do
			labels = Label.list["total_entries"]
			case_labels = Case.list["_embedded"]["entries"].sort_by {|label| label["id"]}.first["labels"]

			post :create, {"name" => "Test Label #{Time.now.to_i}", "case_id" => "1"}

			expect(Label.list["total_entries"]).to eq(labels + 1)

			new_case_labels = Case.list["_embedded"]["entries"].sort_by {|label| label["id"]}.first["labels"]

			expect(new_case_labels.size).to eq(case_labels.size + 1)
		end
	end
end
