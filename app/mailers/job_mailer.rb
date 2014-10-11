class JobMailer < ActionMailer::Base
  default from: "hello@remotebitcoinjobs.com"

  def welcome_email(job)
    @job = job
    mail(to: @job[:email], subject: "Welcome to Remote Bitcoin Jobs")
  end
end
