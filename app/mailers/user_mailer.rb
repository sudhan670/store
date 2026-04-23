class UserMailer < ApplicationMailer
	default from: "noreply@foodie.app"
	def welcome_email(user)
	    @user = user
	    @url  = login_url
	    mail(to: @user.email, subject: "Welcome to Our App 🎉")
	end
end
