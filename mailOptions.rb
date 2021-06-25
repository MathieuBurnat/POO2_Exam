require "./options/addSysinfo"
require "./options/markdownize"

class MailOptions
    def initialize
        @options = []

        add(Markdownize.new) = ARGV.delete('--markdownize') 
        add(AddSysinfo.new) =  ARGV.delete('--add-sysinfo')
    end

    def add(option)
        @options.push(option)
    end
end