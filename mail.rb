class Mail
    attr_reader :mail_message, :from, :recipients, :message
    def initialize(from, recipients, message)
        @mail_message = create(from, recipients, message)
        @from = from
        @recipients = recipients
        @message = message
    end

    def create(from, recipients, messag)

mail_message = <<END_OF_MESSAGE
From: #{from}
To: #{recipients.join(", ")}
MIME-Version: 1.0
Content-type: text/html
Subject: Notification

#{message}
END_OF_MESSAGE
        return mail_message
    end

end
