class ContactMailer < ApplicationMailer
 default from: "dinemediacom@gmail.com"
def send_contact(name, email, subject, message)
@name = name
@email = email
@subject = subject
@message = message

mail(:to => "kammaranagaraju@gmail.com", :subject => subject)
end

def send_invoice(order)
@order = order
mail(:to => @order.email, :subject => "order (##{@order.id}) - #{@order.ordered_date.strftime('%B %d, %Y')}")
end
end
