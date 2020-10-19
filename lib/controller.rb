require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
    erb :new_gossip
  end

  post '/gossips/new/' do
    puts Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

end




