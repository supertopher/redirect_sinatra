get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/' do
  # create a new Url
  full_url = params[:full_url]
  # user_input = Url.create (full_url: full_url) 
  short_url = nil
  redirect '/urls'
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end
