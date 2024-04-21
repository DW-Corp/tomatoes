ActionMailer::Base.smtp_settings = {
  address: 'smtpout.secureserver.net',
  port: '465',
  authentication: :plain,
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
  domain: 'dwcorp.com.br'
}
ActionMailer::Base.delivery_method = :smtp
