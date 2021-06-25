require './mailListener'
require './mail'
require './config'

config = YAML.load_file('./config.yml')

port = ARGV[0] || 25
mailAdress = ARGV[1] || "mail.cpnv.ch"
from = ARGV[2] || config.dig("from")
message = ARGV.shift

mail = Mail.new(from, recipients)
mail.addRecipient("mathieu.burnat@cpnv.ch")
mail.addRecipient("pascal.hurni.nospam@cpnv.ch")
mail.addRecipient("alexandre.philbert.nospam@cpnv.ch")

mail.create(message)

MailListener.new(mailAdress, port, mail)


