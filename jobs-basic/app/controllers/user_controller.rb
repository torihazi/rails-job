class UserController < ApplicationController
    def first_user
        UserJob.perform_later(user: User.first)
        render json: { message: "UserJob performed" }
    end
end
