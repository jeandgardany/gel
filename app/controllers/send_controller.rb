class SendController < ApplicationController
  def index
  end

  def contact_send(params) 
  	@parameters=params 
  		mail(to:'jeandgardany@gmail.com',
  		subject:@parameters[:subject]) 
  end

   def create
	 @params= params
	 ContactMailer.contact_send(params).deliver
	 flash[:notice]= "mensagem enviada"
	 redirect_to send_path
  end

end
