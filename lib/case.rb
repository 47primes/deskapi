class Case < Api

	class << self
		def list
			JSON.parse access_token.get("https://47primes.desk.com/api/v2/cases").body
		end
	end

end