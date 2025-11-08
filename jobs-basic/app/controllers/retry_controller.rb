class RetryController < ApplicationController
    def retry
        id = rand(1..10)
        RetryJob.perform_later(id: id)
        render json: { message: "RetryJob performed with id: #{id}" }
    end
end
