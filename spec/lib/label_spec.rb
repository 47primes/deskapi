require 'spec_helper'

describe Label do
	describe ".list" do
		it "should return the number of entries" do
			expect(Label.list["total_entries"]).to be_a(Fixnum)
		end
	end

	describe ".create" do

	end
end