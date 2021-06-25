require "./options/addSysinfo"
require "./options/markdownize"

class MailOptions
    attr_reader :options
    def initialize
        @options = []

        add(Markdownize.new) 
        add(AddSysinfo.new)  
        # To Do :
        # Set something like :
        # add_sysinfo = ARGV.delete('--add-sysinfo') 
        # markdownize = ARGV.delete('--markdownize')
    end

    def add(option)
        @options.push(option)
    end
end