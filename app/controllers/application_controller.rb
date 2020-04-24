require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/team' do
        @team_name = params[:team][:name]
        @team_motto = params[:team][:motto]

        @hero_name = []
        @hero_power = []
        @hero_bio = []

        @team_members = params[:team][:members]
        @team_members.each do |x|
            @hero_name.push x[:name]
            @hero_power.push x[:power]
            @hero_bio.push x[:bio]
        end

        erb :team
    end
end
