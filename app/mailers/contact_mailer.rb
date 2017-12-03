class ContactMailer < ApplicationMailer
	default from: "GeNis <contacto@localhost.com>"

	def contact_send(params) 
  	@parameters=params 
  		mail(to:'jeandgardany@gmail.com',
  		subject:@parameters[:subject]) 
  	end
end
