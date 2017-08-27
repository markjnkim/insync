get '/' do
  slim :'index'
end

# users new
get '/register' do
  @user = User.new
  slim :'users/new'
end

# users create
post '/users' do
  @user = User.create(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect :'/profile'
  else
    status 422
    @errors = @user.errors.full_messages
    slim :'users/new'
  end
end

get '/profile' do
  slim :'/users/show'
end

get '/users/new' do
  slim :'/users/new'
end

get '/users/:id' do
  slim :'users/show'
end

get '/users/events/:id' do
  @event = Event.find(params[:id])
  slim :'events/show'
end
