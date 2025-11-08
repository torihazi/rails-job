Rails.application.routes.draw do
  get "hello", to: "hello#hello"
  get "notify", to: "notification#notify"
  get "report", to: "report#report"
  get "first_user", to: "user#first_user"
  get "remind", to: "remind#remind"
  get "retry", to: "retry#retry"
  get "logging", to: "logging#logging"
end
