class MyApplication < Sinatra::Base

  before "/admin/*" do
    protected!
  end

  get "/admin/" do
    @images = Image.paginate( page: params["page"] , per_page: 3 ).includes(:comments).where( user: authenticated_user )
    erb :admin

  end

  get "/admin/mon" do
    "MON"
  end

end
