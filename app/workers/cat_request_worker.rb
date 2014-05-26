class CatRequestWorker
	include Sidekiq::Worker
	
	def perform req_id
		req = CatRequest.find req_id
		return unles req
		req.fulfill
	end
end
