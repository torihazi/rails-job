class ReportController < ApplicationController
    def report
        ReportJob.perform_later(
            option: {
                user_id: 1,
                message: "Hello, World!",
                notification_type: "email"
            }
        )
        render json: { message: "ReportJob performed" }
    end
end
