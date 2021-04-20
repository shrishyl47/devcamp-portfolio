class Portfolio < ApplicationRecord
	has_many :technologies
	accepts_nested_attributes_for :technologies, allow_destroy: true, reject_if: lambda { |args| args['name'].blank? }

	validates_presence_of :title, :body

	mount_uploader :thumb_image, AvatarUploader
	mount_uploader :main_image, AvatarUploader

	# One way to write custom scope
	def self.angular
		where(subtitle: 'Angular')
	end

	# One way to write custom scope
	def self.by_position
		order("position ASC")
	end

	# Another way to write custom scope using lambda
	scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
end
