class Mail
    attr_reader :mail_message, :from, :recipients, :message
    def initialize(from, recipients)
        @mail_message = ""
        @from = from
        @recipients = recipients
        @message = ""
    end

    def create(message)

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
