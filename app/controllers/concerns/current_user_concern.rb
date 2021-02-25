module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
		# what super does here is: I want the exact same behaviour as the super method we are overriding i.e. current_user method of devise gem.
		super || guest_user
	end

	def guest_user
		OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "asdf@asdf.com")
	end
end