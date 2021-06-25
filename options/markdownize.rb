require 'kramdown'

module MailOptions
    class Markdownize
        def addOptionTo(message)
            return message = Kramdown::Document.new(message).to_html
        end
    end
end
