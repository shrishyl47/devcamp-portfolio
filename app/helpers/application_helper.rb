module ApplicationHelper
	def login_helper style = ''
		if current_user.is_a?(GuestUser) 
			(link_to "Register", new_user_registration_path, class: style) + 
			" ".html_safe +
			(link_to "Login", new_user_session_path, class: style)
		else 
			link_to "Logout", destroy_user_session_path, method: :delete, class: style
		end 
	end

	def source_helper(styles)
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]}, Please feel free to #{ link_to 'contact me', contact_path } if you'd like to work together."
			content_tag(:div, greeting.html_safe, class: styles)
		end
	end

	def copyright_generator
		ShrishylViewTool::Renderer.copyright 'Shrishyl V', 'All rights reserved'
	end

	def nav_items
		# return an array of hashes
		[
			{
				url: root_path,
				title: 'Home'
			},
			{
				url: about_path,
				title: 'About Me'
			},
			{
				url: contact_path,
				title: 'Contact'
			},
			{
				url: blogs_path,
				title: 'Blog'
			},
			{
				url: portfolios_path,
				title: 'Portfolio'
			},
			{
				url: tech_news_path,
				title: 'Tech News'
			}
		]
	end

	def nav_generator css_style, tag_type
		# Old way of code
		#nav_links = <<NAV
		#<#{tag_type}><a href="#{root_path}" class="#{css_style} #{active? root_path}">Home</a></#{tag_type}>
		#<#{tag_type}><a href="#{about_path}" class="#{css_style} #{active? about_path}">About Me</a></#{tag_type}>
		#<#{tag_type}><a href="#{contact_path}" class="#{css_style} #{active? contact_path}">Contact</a></#{tag_type}>
		#<#{tag_type}><a href="#{blogs_path}" class="#{css_style} #{active? blogs_path}">Blog</a></#{tag_type}>
		#<#{tag_type}><a href="#{portfolios_path}" class="#{css_style} #{active? portfolios_path}">Portfolio</a></#{tag_type}>
		#NAV

		# new way of code
		nav_links = ''
		nav_items.each do |item|
			nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{css_style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
		end

		nav_links.html_safe
	end

	def active? path
		"active" if current_page? path
		# return active if the current page(rails inbuilt method) matches the path we pass in.
	end

	def alerts
		alert = (flash[:alert] || flash[:error] || flash[:notice])

		if alert
			alert_generator alert
		end
	end

	def alert_generator message
		js add_gritter(message, title: "Shrishyl Portfolio", sticky: false, class_name: "custom_gritter", time: 3000)
	end
end