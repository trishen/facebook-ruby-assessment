# index
get '/users/comments' do
end

# new
get '/users/comments/new' do
end

# create
post '/users/:user_id/comments' do
	user = User.find(params[:user_id])

	comment = user.comments.new(description: params[:comment], post_id: params[:post_id], user_id: params[:user_id])

	if comment.save
		@msg = "Comment sucessfully added !"
	else
		@msg = "Comment failed to be added"
	end

  redirect "/?@msg"
end

# show
get '/users/:user_id/comments/:comment_id' do
end

# edit
get '/users/comments/:comment_id/edit' do
	@comment = Comment.find(params[:comment_id])
	erb :"comments/edit"
end

# update
post '/users/comments/:comment_id' do
	comment = Comment.find(params[:comment_id])
	comment.description = params[:update_description]
	comment.save

	redirect "/"
end

# delete
delete '/users/comments/:comment_id' do
	comment = Comment.find(params[:comment_id])
	comment.destroy

	redirect "/"
end