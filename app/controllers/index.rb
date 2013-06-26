enable :sessions
before do
  current_user
end
get '/' do

  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/login' do
  @user = User.find_by_email(params[:email])

  if @user && @user.authenticate(params[:password])
    session[:user_id]     = @user.id
    session[:user_email]  = @user.email
  end
  erb :login
end

post '/logout' do
  @user = nil
  session.clear
  redirect '/'
end

post '/' do
  # create a new Url
  full_url = params[:full_url]
  @user_input = Url.create(full_url: full_url, click_counter: 0) 
  @short_url = @user_input.id
  redirect "/#{@short_url}"
end

# e.g., /q6bda
get '/:short_url' do
  @display_url = params[:short_url]
  @original_url = Url.find(@display_url).full_url
  @count = Url.find(@display_url).click_counter
  erb :url
end

get '/r/:short_url' do
  short = params[:short_url].to_i
  this_record = Url.find(short)
  destination = this_record.full_url
  this_record.click_counter += 1
  this_record.save
  redirect "http://www.#{destination}"
end

# get '/u' do
#   puts "hi"
  
# end
