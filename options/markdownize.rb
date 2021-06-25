require 'kramdown'

class Markdownize
    def addOptionTo(message)
        return message = Kramdown::Document.new(message).to_html
    end
end
