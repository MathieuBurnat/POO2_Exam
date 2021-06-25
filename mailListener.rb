require 'net/smtp'

class MailListener
    def initialize(mail, port, mail_message, from, recipients)
        Net::SMTP.start(mail, port) do |smtp|
            smtp.send_message mail_message,
            from,
            recipients
          end
    end
end