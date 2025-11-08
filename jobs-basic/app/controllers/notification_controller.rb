class NotificationController < ApplicationController
    def notify
        NotificationJob.perform_later(user_id: 1, message: "Hello, World!", notification_type: "email")
        render json: { message: "NotificationJob performed" }
    end
end
