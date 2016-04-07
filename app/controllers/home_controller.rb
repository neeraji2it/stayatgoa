class HomeController < ApplicationController
  def index
  	   @contacts = Contact.all
  	   
  end
  
def contact
end

 def contact_us
      if params[:name].present? && params[:email].present? &&  params[:message].present?
       ContactMailer.send_contact(params[:name], params[:email],params[:subject], params[:message]).deliver
            params[:name] = params[:email] = params[:subject] = params[:message] =  " "
            @status = true
          else
            @status = false
          end
          respond_to do |format|
            format.js
          end            
  end
end
