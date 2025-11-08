class RetryController < ApplicationController
    def retry
        RetryJob.perform_later()
        render json: { message: "RetryJob performed" }
    end
end
