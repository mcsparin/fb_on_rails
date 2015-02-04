class Users::OmniauthCallbacksController< Devise::OmniauthCallbacksController
	def facebook
		@user = User.find_or_create_from_auth_hash auth_hash
		if @user.persisted?
			sign_in_and_redirect_user
		else
			session["devise.user_attributes"]=@user.attributes
			redirect_to_new_user_registration_url, notice: "Oops somehting went wrong"
		end
	
		private

		def auth_hash
			request.env['omniauth.auth']
		end
	end
