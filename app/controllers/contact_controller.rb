class ContactController < ApplicationController

  def index
    client = SendGrid::Client.new(api_key: ENV["SENDGRID_LACED_EMAIL_API"])

    mail = SendGrid::Mail.new do |m|
      m.to = "ricardo.lopez.a@gmail.com"
      m.from = "params[:email]"
      
      m.from_name = params[:from_name]
      m.subject = params[:brand]
      
      m.text = params[:message]
      m.html = "<p style='color: red;'>#{params[:message]}</p>"
    end

    response = client.send(mail)

    if response.code == 200
      "Thank you. Your email has been sent."
    else
      "There has been an error sending your email. Please try again"
    end
  end



end
