class HelloController < ApplicationController
    def hello
        SampleJob.perform_later("Hello, World!")
        render json: { message: "Hello, World!" }
    end
end
