class CommentBroadcastJob < ApplicationJob
	queue_as :default

	def perform(comment)
		# start a broadcast on actioncable with channel name as "blogs_#{comment.blog.id}_channel"
		ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
	end

	private

	def render_comment(c)
		# render the partial with required comment parameter
		CommentsController.render partial: 'comments/comment', locals: {comment: c}
	end
end