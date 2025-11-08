Rails.application.routes.draw do
  get "hello", to: "hello#hello"
  get "notify", to: "notification#notify"
  get "report", to: "report#report"
  get "first_user", to: "user#first_user"
end
