class MyApplication < Sinatra::Base


get "/" do
  @images = Image.paginate( page: params["page"] , per_page: 16 )
  erb :index
end

post "/admin/" do
     img = Image.new
     img.image   = params[:file]
     img.caption = "This is the caption"
     img.user    = authenticated_user()
     img.save!

     #Save success message to the session
      flash[:success] = "Successfully created new Todo Item"

      #Save success message to the session
      flash[:danger] = "There is an error with your data"


     redirect to("/admin/")

 end

  get "/admin/" do
    #Get an instance of an Image
    @image = Image.paginate( page: params["page"] , per_page: 3 )
    erb :user
  end

  get "/image/:id/delete" do
    @image = Image.find(params[:id])
    @image.destroy
    flash[:success] = "Successfully Deleted Image"
    redirect "/admin/"
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
