class UserMailer < ApplicationMailer
	default from: 'from@example.com'

	def bem_vindo(user)
		@user = user
		@url = 'http://localhost:3000/login'
		mail(to: @user.email, subject: 'Bem Vindo ao Site')
	end
end
