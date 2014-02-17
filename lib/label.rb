class Label < Api

	class << self
		def list
			JSON.parse access_token.get("https://47primes.desk.com/api/v2/labels").body
		end

		def create
			
		end
	end

end