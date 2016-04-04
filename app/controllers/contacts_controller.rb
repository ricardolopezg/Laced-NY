class ContactsController < ApplicationController

  def new 
    @contact = Contact.new 
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    if @contact.deliver
      flash[:notice] = 'Thank you for your email. We will be in touch.'
      render :new
    else
      flash[:error] = 'Cannot send message.'
      render :new


    end
  end
end
