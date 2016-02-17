# index
get '/' do
  @posts = Post.all
  @comments = Comment.all
  @msg = params[:message]
  erb :"index"
end

# new
get '/users/new' do
  erb :"users/new"
end

# create
post '/users' do
  user = User.new(params[:user])

  if user.save #this checks and save one shot
    @msg = "User created!"
    session[:user_id] = user.id # log in this bloody user
  else
    @msg = "Sign up unsucessful :'("
  end

  redirect "/?message=#{@msg}"
end

# show
get '/users/:user_id' do
end

# edit
get '/users/:user_id/edit' do
end

# update
post '/users/:user_id/update' do
end

get '/login' do
  erb :"users/login"
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])

  if !user.nil?
    @msg = "Welcome back #{user.username}"
    session[:user_id] = user.id
  else
    @msg = "Wrong password !"
  end

  redirect "/?message=#{@msg}"
end

delete '/logout' do
  session.delete(:user_id)
  @msg = "Successfully logged out!"
  redirect "/?message=#{@msg}"
end