require "./recipientConfiguration/filename"
require "./recipientConfiguration/dbconnection"

class Recipients
    attr_reader :recipients
    def initialize
        @confs = []

        add(RecipientsFilename.new) 
        add(RecipientsDbconnection.new)
        
        @recipients = setRecipients()
    end

    def setRecipients
        @recipients.confs.each do |conf|
            recipients = conf.addConfTo(recipients)
        end
    end

    def add(conf)
        @confs.push(conf)
    end
end
