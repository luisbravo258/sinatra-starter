class MyApplication < Sinatra::Base

    get "/login" do
      erb :login
    end

    post "/login" do
      @user = authenticate( params["username"] , params["password"] )
      if authenticated?
        redirect "/admin/"
      else
        @success = false
        erb :login
      end

    end

    get "/logout" do
      logout!
    end

end


# This is form the TODO
#
#
# post '/login' do
#   if authorize( nil )
#     redirect to("/")
#   else
#       @error = "Invalid Username/Password"
#   end
#   erb :login
# end
#
# get '/logout' do
#   logout!
# end
