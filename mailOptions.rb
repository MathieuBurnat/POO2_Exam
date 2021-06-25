require "./options/addSysinfo"
require "./options/markdownize"

class MailOptions
    attr_reader :argOptions
    def initialize
        @argOptions = []
        @options = []

        add(Markdownize.new) 
        add(AddSysinfo.new) 
    end

    def useOptionsWith(message)
        @options.each do |option|
            message = option.useOptionsWith(@argOptions, message)
        end

        return message
    end

    def add(option)
        @options.push(option)
    end
end