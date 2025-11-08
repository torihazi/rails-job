class RemindController < ApplicationController
    def remind
        ReminderJob.set(wait: 10.seconds).perform_later
        ReminderJob.set(wait_until: Time.zone.parse("2025-11-08 14:54")).perform_later
        render json: { message: "ReminderJob scheduled to perform at #{Time.current + 10.seconds} and #{Time.zone.parse("2025-11-08 14:54")}" }
    end
end
