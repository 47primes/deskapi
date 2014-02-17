class Case < Api

	class << self
		def list
			JSON.parse access_token.get("https://47primes.desk.com/api/v2/cases", {"Accept" => "application/json"}).body
		end

		def append_label(id, label)
			return if id.blank? || label.blank?
			access_token.put "https://47primes.desk.com/api/v2/cases/#{id}", 
											 {"labels" => label}.to_json,
											 {"Accept" => "application/json"}
		end
	end

end