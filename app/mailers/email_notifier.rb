class EmailNotifier < ActionMailer::Base
  
  default :from => 'no-reply@askaway.com',
         :return_path => 'thereyougo@askaway.com'

  def question_for_you(recipient)
    @topic = recipient
    mail(:to => @topic.addressee.identity_value,
         :bcc => ["nick@tmro.net", "Office <office@tmro.net>"])
  end  
end
