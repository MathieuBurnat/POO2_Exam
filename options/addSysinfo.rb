class AddSysinfo
    def useOptionsWith(argOptions, message)
        if argOptions.include? "--add-sysinfo"
            message += "\n\n---\n\n"
            message += " - RUBY_VERSION: #{RUBY_VERSION}\n"
        end

        return message
    end
end