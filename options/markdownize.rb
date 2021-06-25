require 'kramdown'

class Markdownize
    def useOptionsWith(argOptions, message)
        if argOptions.include? "--markdownize"
            message = Kramdown::Document.new(message).to_html
        end

        return message
    end
end
