require 'net/smtp'

class MailListener
    def initialize(mailAdress, port, mail)
        Net::SMTP.start(mailAdress, port) do |smtp|
            smtp.send_message mail.mail_message,
            mail.from,
            mail.recipients
          end
    end
end