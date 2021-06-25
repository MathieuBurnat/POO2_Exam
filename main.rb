require './mailListener'
require './mail'

port = ARGV[0] || 25
mailAdress = ARGV[1] || "mail.cpnv.ch"

from = "mathieu.burnat@cpnv.ch"

message = ARGV.shift

mail = Mail.new(from, recipients)
mail.addRecipient("mathieu.burnat@cpnv.ch")

mail.create(message)

MailListener.new(mailAdress, port, mail)


