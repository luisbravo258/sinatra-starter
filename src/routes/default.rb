class MyApplication < Sinatra::Base

  # get "/" do
  #   erb :index
  # end

#   get "/upload" do
#
#     erb :upload
#   end
#
#   post "/upload" do
#     File.open('uploads/' + params['myfile'][:filename], "w") do |f|
#       f.write(params['myfile'][:tempfile].read)
#   end
#
#   return "The File was successfully uploaded"
#
#   end
#
#
#   get "/contact" do
#
#     erb :contact
#   end
#
# get "/signup" do
#  erb :signup
#  end
#
#   require 'pony'
#   post '/signup' do
#     Pony.mail :to => 'you@example.com',
#               :from => 'me@example.com',
#               :subject => 'Howdy, Partna!'
#   end
#
# end

post "/" do
     img = Image.new
     img.image   = params[:file]
     img.caption = "This is the caption"
     img.user    = User.find(1)
     img.save!
     redirect to("/")
 end

  get "/" do
    #Get an instance of an Image
    @images = Image.paginate( page: params["page"] , per_page: 10 )
    erb :index
  end

  get "/comments/:id" do
    @image = Image.find( params[:id] )
    erb :comment
  end

  post "/comments/:id" do
    @image   = Image.find( params[:id] )
    form_data = params["comment"]
    form_data[:image] = @image
    @comment = Comment.create! form_data
    erb :comment
  end


end
