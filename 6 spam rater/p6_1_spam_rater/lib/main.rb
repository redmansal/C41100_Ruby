#
# main.rb
#
# author:        Colm Nolan 
# last modified: 27 October, 2011
# description   This program check 10 emails and rates how much they might be consided 
#               to be advance-fee fraud emails. The first five are while the second fine are not 

require '../lib/email.rb'
require '../lib/spam.rb'

spam = Spam.new("spam3.txt")

email = [] 
email[0] = Email.new("emails/e-mail1.txt")
email[1] = Email.new("emails/e-mail2.txt")
email[2] = Email.new("emails/e-mail3.txt")
email[3] = Email.new("emails/e-mail4.txt")
email[4] = Email.new("emails/e-mail5.txt")
email[5] = Email.new("emails/e-mail6.txt")
email[6] = Email.new("emails/e-mail7.txt")
email[7] = Email.new("emails/e-mail8.txt")
email[8] = Email.new("emails/e-mail9.txt")
email[9] = Email.new("emails/e-mail10.txt")


email.each do |e_mail|
  e_mail.rate_me_for_spam(spam)
end

email.each do |e_mail|
  e_mail.print_my_details
end

