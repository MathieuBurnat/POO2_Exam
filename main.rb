require './mailListener'
require './mail'

config = YAML.load_file('./config.yml')

port = ARGV[0] || 25
mailAdress = ARGV[1] || "mail.cpnv.ch"
from = ARGV[2] || config.dig("from")
message = ARGV.shift || "This is a mail test !"

mail = Mail.new(from)

mail.addOption('--add-sysinfo')
mail.addOption('--markdownize')

mail.addRecipient("mathieu.burnat@cpnv.ch")
mail.addRecipient("pascal.hurni.nospam@cpnv.ch")
mail.addRecipient("alexandre.philbert.nospam@cpnv.ch")

puts "Display Recipients"
p mail.recipients

mail.create(message)

MailListener.new(mailAdress, port, mail)


