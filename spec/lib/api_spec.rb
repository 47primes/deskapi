require 'spec_helper'

describe Api do
	describe ".authenticate" do
		it "should set access_token" do
			expect(Api.instance_variable_get(:@access_token)).to be_nil

			Api.authenticate

			expect(Api.instance_variable_get(:@access_token)).to be_a(OAuth::AccessToken)			
		end
	end
end