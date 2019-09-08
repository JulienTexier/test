class UserMailer < ApplicationMailer
	  default from: 'gotmycat-picture@laposte.net'
	 
	  def welcome_email(user)
	    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
	    @user = user 

	    #on définit une variable @url qu'on utilisera dans la view d’e-mail
	    @url  = 'https://marketplace-development.herokuapp.com/users/sign_in' 

	    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
	    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
	  end

	  def new_order_email(order)
	    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
	    @user = order.user 

	    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
	    mail(to: @user.email, subject: "Vous avez effectué une commande !") 
	  end

	  def new_order_email_admin(order)
	    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
	    @user = order.user 
	    @admin = User.where(is_admin: "true")

	    @admin.each do |admin|
	    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
	    mail(to: admin.email, subject: "Une commande a été effectué sur votre boutique !")
		end
	  end

end
