require './mailListener'
require './mail'

config = YAML.load_file('./config.yml')

port = ARGV[0] || 25
mailAdress = ARGV[1] || "mail.cpnv.ch"
from = ARGV[2] || config.dig("from")
message = ARGV.shift || "This is a mail test !"

mail = Mail.new(from)

mail.addOption(ARGV.delete('--add-sysinfo'))
mail.addOption(ARGV.delete('--markdownize'))

mail.addRecipient("mathieu.burnat@cpnv.ch")
mail.addRecipient("pascal.hurni.nospam@cpnv.ch")
mail.addRecipient("alexandre.philbert.nospam@cpnv.ch")

mail.create(message)

MailListener.new(mailAdress, port, mail)


