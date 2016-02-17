# index
get '/users/posts' do
end

# new
get '/users/posts/new' do
end

# create
post '/users/:user_id/posts' do
	user = User.find(params[:user_id])

	post = user.posts.new(description: params[:post])

	if post.save
		@msg = "Post sucessfully added !"
	else
		@msg = "Post failed to be added"
	end

  redirect "/?@msg"

end

# show
get '/users/:user_id/posts/:post_id' do
end

# edit
get '/users/posts/:post_id/edit' do
  @post = Post.find(params[:post_id])
  erb :"posts/edit"
end

# update
post '/users/posts/:post_id' do
  post = Post.find(params[:post_id])
  post.description = params[:update_description]
  post.save

  redirect "/"
end

# delete
delete '/users/posts/:post_id' do
  post = Post.find(params[:post_id])
  post.destroy

  redirect "/"
end