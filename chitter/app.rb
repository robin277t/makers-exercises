$LOAD_PATH << "lib"
require 'sinatra'
require "sinatra/reloader"
require 'database_connection'
require 'peeps_repo'
require 'users_repo'

DatabaseConnection.connect

class Application < Sinatra::Base
  
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    # also_reload 'lib/peeps_repo' #needed?
    # also_reload 'lib/users_repo' #needed?
  end

  
  get '/' do
    
    if session[:username] == nil
      @peeps = PeepsRepo.new.show_all_peeps
      erb(:homepage)    
    else
      @peeps = PeepsRepo.new.show_all_peeps
      @username = session[:username] 
      erb(:peepspage)
    end
    
  end
  
  get '/account' do
    if session[:username] == nil
      erb(:login)
    else
      @username = session[:username] 
      erb(:account)
    end
  end


  get '/signup' do
    if session[:username] != nil
      redirect('/')
    else
      erb(:signup)
    end
  end

  get '/login' do
    if session[:username] != nil
      redirect('/')
    else
      erb(:login)
    end
  end

  get '/deletepeep' do
    if session[:username] == nil
      redirect('/')
    else
      @peeps = PeepsRepo.new.show_all_peeps
      @username = session[:username] 
      erb(:deletepeep)
    end
  end

  get '/personpeeps' do
    selected_user = User.new
    selected_user.id = params[:id]
    selected_user.username = params[:username]
    # TODO NOTE: MAKE SURE THAT PERSONPEEPS GET REQUEST COMES WITH PARAMS OF USER CLICKED ON
    @peeps = PeepsRepo.new.show_your_peeps(selected_user.id)
    @username = UsersRepo.new.view_user(selected_user.username).username
    erb(:personpeeps)
  end


  post '/' do
    # FOR SOME REASON THIS DOESN'T WORK FROM FORM
    if session[:username] == nil
      status 400
      return ''
    elsif params[:content] == '' #TODO ADD WHITESPACE VALIDATION
      status 400
      return ''
    else
      @user_id = session[:user_id]
      @content = params[:content]
      @time = PeepsRepo.new.add_peep(@user_id,@content)
      @username = session[:username]
      erb(:peeppostsuccess)
    end
  end

  ######### SESSION POSTS FOR AUTHENTICATION BELOW HERE
  
  post '/login' do
    # if tests here for login validation then session set
    newuser = UsersRepo.new.view_user(params[:username])
    session[:username] = newuser.username
    session[:user_id] = newuser.id
    session[:email] = newuser.email
    @username = session[:username]
    erb(:loginsuccess)
  end

  post '/logout' do
    session.clear
    redirect('/')
  end

  post '/signup' do
    createduser = UsersRepo.new.add(params[:username],params[:password],params[:email])
    newuser = UsersRepo.new.view_user(params[:username])
    session[:username] = newuser.username
    session[:user_id] = newuser.id
    session[:email] = newuser.email
    @username = session[:username]
    erb(:loginsuccess)
  end

  ###############




#   get /\/albums\/([\d]+)/ do |urlid| 
#     albumlist = AlbumRepository.new
#     artistlist = ArtistRepository.new
#     @chosenalbum = albumlist.find(urlid)
#     @artistname = artistlist.find(@chosenalbum.artist_id).name
#     return erb(:index)
#   end


  # post '/albums/newalbum' do
  #   if params[:title] == nil || params[:release_year] == nil || params[:artist_id] == nil
  #     status 400
  #     return ''
  #   elsif params[:title] == "" || params[:release_year] == "" || params[:artist_id] == ""
  #     status 400
  #     return ''
  #   end
  #   @new_alb = Album.new
  #   @new_alb.title = params[:title]
  #   @new_alb.release_year = params[:release_year]
  #   @new_alb.artist_id = params[:artist_id]
  #   newrepo = AlbumRepository.new.create(@new_alb)
  #   erb(:addsuccess)
  # end


end