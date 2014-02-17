require 'spec_helper'

describe Case do
	describe ".list" do
		it "should return the number of entries" do
			expect(Case.list["total_entries"]).to be_a(Fixnum)
		end
	end

	describe ".append_label" do
		it "should append a label to the case" do
			c = Case.list["_embedded"]["entries"].sort_by {|c| c["id"]}.first
			labels = c["labels"]

			Case.append_label(c["id"], "Test Append Label #{Time.now.to_i}")

			c = Case.list["_embedded"]["entries"].sort_by {|c| c["id"]}.first
			expect(c["labels"].size).to eq(labels.size + 1)
		end
	end
end