require 'spec_helper'

describe CasesController do
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

    it "loads all of the cases into @cases" do
      get :index

      expect(assigns(:cases)).to be_a(Hash)
    end
	end
end
