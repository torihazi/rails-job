class LoggingController < ApplicationController
    def logging
        LoggingJob.perform_later(message: "Hello, World!")
        render json: { message: "LoggingJob performed" }
    end
end
