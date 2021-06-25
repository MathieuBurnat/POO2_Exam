require 'kramdown'
require './mailListener'
require './mail'

config = {
  'recipients_filename' => 'recipients.txt',
  'recipients_dbconnection' => nil
}

from = "mathieu.burnat@cpnv.ch"

recipients = []

if config['recipients_filename']
  recipients.concat(File.readlines(config['recipients_filename'], chomp: true))
end

if config['recipients_dbconnection']
  recipients << "other@cpnv.ch"
end


add_sysinfo = ARGV.delete('--add-sysinfo')
markdownize = ARGV.delete('--markdownize')

message = ARGV.shift

if add_sysinfo
  message += "\n\n---\n\n"
  message += " - RUBY_VERSION: #{RUBY_VERSION}\n"
end

if markdownize
  message = Kramdown::Document.new(message).to_html
end

mail = Mail.new(from, recipients)
mail.create(message)

port = ARGV[0] || 25
mailAdress = ARGV[1] || "mail.cpnv.ch"

MailListener.new(mailAdress, port, mail)


