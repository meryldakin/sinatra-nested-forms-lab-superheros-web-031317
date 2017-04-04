require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do

      erb :super_hero
    end

    post '/team' do
      @team = Team.new(params[:team])
      @members = params[:team][:members].map do |member|
        Member.new(member)
      end
      erb :team
    end


end
