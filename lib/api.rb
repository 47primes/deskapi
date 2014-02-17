class Api

	class << self
		def authenticate
			return if @access_token

	  	consumer = OAuth::Consumer.new(ENV["DESK_KEY"], ENV["DESK_SECRET"], :site => "https://47primes.desk.com", :scheme => :header)

			@access_token = OAuth::AccessToken.from_hash(consumer, :oauth_token => ENV["DESK_OAUTH_TOKEN"], :oauth_token_secret => ENV["DESK_OAUTH_SECRET"])
		end

		def access_token
			@access_token || authenticate
		end
	end

end