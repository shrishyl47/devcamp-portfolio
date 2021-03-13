module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
		# what super does here is: I want the exact same behaviour as the super method we are overriding i.e. current_user method of devise gem.
		super || guest_user
	end

	def guest_user
		guest = GuestUser.new
		guest.name = "Guest User"
		guest.first_name = "Guest"
		guest.last_name = "User"
		guest.email = "asdf@asdf.com"
		guest
	end
end