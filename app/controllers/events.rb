get '/events/new' do
  @event = Event.new
  slim :'events/new'
end

get '/events/:id' do
  @event = Event.find(params[:id])
  slim :'events/show'
end

get '/events' do
  redirect '/profile'
end

post '/events' do
  @event = Event.new(params[:event])
  if @event.save
    redirect :'/profile'
  else
    status 422
    @error_messages = @event.errors.full_messages
    slim :'events/new'
  end
end
