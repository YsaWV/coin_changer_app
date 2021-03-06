require 'sinatra'
require_relative 'coin_changer'

get '/' do 
	erb :get_name
end

post '/name' do
	name = params[:user_name]
	redirect '/help?user_name=' + name
end

get '/help' do 
	name = params[:user_name].capitalize
	erb :get_help, :locals => {:name => name}
end

post '/help' do
	name = params[:user_name]
	ans = params[:ques]
	if 	ans == "Yes"
		erb :get_change, :locals => {:name => name}
	else
		ans == "No"
		erb :get_move, :locals => {:name => name}
	end
end

post '/changer' do
	#c = params[:c]
	name = params[:user_name]
	change = params[:cents]
	#if c == 5
		#erb :get_too
	#else
		coins = coin_changer(change.to_i)
		erb :get_again, :locals => {:coins => coins, :name => name,}		
	#end
	#c += 1
end

get '/chance' do
	name = params[:user_name]
	erb :get_chance, :locals => {:name => name}
end

post '/chance' do
	name = params[:user_name]
	ans = params[:ques]
	if 	ans == "Yes"
		erb :get_change, :locals => {:name => name}
	else
		ans == "No"
		erb :get_fine, :locals => {:name => name}
	end
end

post '/sure' do
	name = params[:user_name]
	ans = params[:ques]
	if 	ans == "Yes"
		erb :get_change_loop, :locals => {:name => name}
	else
		ans == "No"
		erb :get_sure, :locals => {:name => name}
	end
end

post '/ok' do
	name = params[:user_name]
	ans = params[:ques]
	if 	ans == "Yes"
		erb :get_bye, :locals => {:name => name}
	else
		ans == "No"
		erb :get_change_loop, :locals => {:name => name}
	end
end