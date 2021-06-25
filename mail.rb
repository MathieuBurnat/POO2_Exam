require "./mailOptions"
require "./recipients"
class Mail
    attr_reader :mail_message, :from, :recipients, :message
    def initialize(from, recipients)
        @mail_message = ""
        @from = from
        @recipients = recipients
        @message = ""

        @mailOptions = MailOptions.new
        @recipients = Recipients.new.recipients
    end

    def addRecipient(recipient)
        @recipients.push(recipient)
    end

    def useOptionsWith(message)
        @mailOptions.options.each do |option|
            message = option.addOptionTo(message)
        end
    end

    def create(message)
        useOptionsWith(message)

@mail_message = <<END_OF_MESSAGE
From: #{@from}
To: #{@recipients.join(", ")}
MIME-Version: 1.0
Content-type: text/html
Subject: Notification

#{message}
END_OF_MESSAGE
    end

end
