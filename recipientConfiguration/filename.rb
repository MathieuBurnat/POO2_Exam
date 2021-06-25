class RecipientsFilename
    def addConfTo(recipients)
        config = YAML.load_file('./config.yml')
        p recipients
        return recipients.concat(File.readlines(config.dig("recipients_filename"), chomp: true))
    end 
end
