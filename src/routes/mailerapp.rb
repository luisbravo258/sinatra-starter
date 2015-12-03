post '/guestbook/sign' do
  Pony.mail :to => params[:email],
            :from => "me@example.com",
            :subject => "Thanks for signing my guestbook, #{params[:name]}!",
            :body => erb(:email)
end
