class JobMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(job)
    @job = job
    mail(to: "rbj@mailinator.com", subject: "It works!")
  end
end
