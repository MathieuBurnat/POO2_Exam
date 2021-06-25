require "./config"

class RecipientsFilename
    def addConfTo(recipients)
        config = YAML.load_file('./config.yml')
        return recipients.concat(File.readlines(config.dig("recipients_filename"), chomp: true))
    end 
end
