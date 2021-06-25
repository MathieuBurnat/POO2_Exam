class RecipientsFilename
    def addConfTo(recipients)
        config = YAML.load_file('./config.yml')

        return recipients.push(File.readlines(config.dig("recipients_filename")))
    end 
end
