require 'spec_helper'

describe Api do
	describe ".cases" do
		it "should return the number of entries" do
			expect(Api.cases["total_entries"]).to be_a(Fixnum)
		end
	end

	describe ".labels" do
		it "should return the number of entries" do
			expect(Api.labels["total_entries"]).to be_a(Fixnum)
		end
	end	
end