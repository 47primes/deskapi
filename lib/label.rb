class Label < Api

	class << self
		def list
			JSON.parse access_token.get("https://47primes.desk.com/api/v2/labels", {"Accept" => "application/json"}).body
		end

		def create(params)
			params = params.with_indifferent_access
			params = {"name" => params["name"], "description" => params["description"], "type" => params["type"] || ["case"], "color" => "default"}.to_json
			access_token.post "https://47primes.desk.com/api/v2/labels", params, 
												{"Accept" => "application/json", "Content-Type" => "application/json"}
		end
	end

end