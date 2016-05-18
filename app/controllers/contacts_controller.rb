class ContactsController < ApplicationController

		def new
   		@contact = Contact.new
  		end

  		def create
    		@contact = Contact.new message_params
    		@contact.request = request
	    	if @contact.deliver
	      	flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
	    	else
	      	flash.now[:error] = 'Cannot send message.'
	      	render :new
	    	end
  		end

  		private

  		def message_params
  			params.require permit(:name, :email, :message)
  		end
end
