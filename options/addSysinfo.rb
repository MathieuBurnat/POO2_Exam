class AddSysinfo
    def addOptionTo(message)
        message += "\n\n---\n\n"
        message += " - RUBY_VERSION: #{RUBY_VERSION}\n"
        return message
    end
end