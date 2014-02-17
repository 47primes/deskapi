require 'spec_helper'

describe Case do
	describe ".list" do
		it "should return the number of entries" do
			expect(Case.list["total_entries"]).to be_a(Fixnum)
		end
	end
end