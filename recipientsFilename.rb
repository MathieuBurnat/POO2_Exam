require "./config"

class RecipientsFilename
    def addConfTo(recipients)
        return recipients.concat(File.readlines(config.dig("recipients_filename"), chomp: true))
    end 
end
