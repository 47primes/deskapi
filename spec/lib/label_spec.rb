require 'spec_helper'

describe Label do
	describe ".list" do
		it "should return the number of entries" do
			expect(Label.list["total_entries"]).to be_a(Fixnum)
		end
	end

	describe ".create" do
		it "should create a new label" do
			size = Label.list["total_entries"]

			response = Label.create(:name => "Hiya#{Time.now.to_i}", :description => "Test Label")

			expect(response.code).to eq("201")
			expect(Label.list["total_entries"]).to equal(size + 1)
		end

		it "should fail when name is blank" do
			size = Label.list["total_entries"]

			response = Label.create(:description => "Test Label")

			expect(response.code).to eq("422")
			expect(Label.list["total_entries"]).to equal(size)
		end

		it "should fail if the name is invalid" do
			size = Label.list["total_entries"]

			response = Label.create(:name => "woot!!", :description => "Test Label")

			expect(response.code).to eq("422")
			expect(Label.list["total_entries"]).to equal(size)			
		end
	end
end