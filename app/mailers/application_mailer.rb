class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('MAILER_SENDER') { 'sender@example.com' }
  layout 'mailer'
end
