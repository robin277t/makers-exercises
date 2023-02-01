require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  it "get '/' not logged in works" do
    response = get('/')
    expect(response.status).to eq(200)
    expect(response.body).to include ("<title>Welcome to Chitter!</title>")
    expect(response.body).to include ("<p> I doubt it will be as good as before --- mrs2 --- peeped")
  end
  
  it "get '/' with logged in works" do
      post('/login', username: 'mrs2')
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include ("<title>mrs2's Chitter page</title>")
      expect(response.body).to include ("<p> I doubt it will be as good as before --- mrs2 --- peeped")
    end

  it "get '/account' fails if not logged in" do
    response = get('/account')
    expect(response.status).to eq (200)
    expect(response.body).to include ("<title>Login</title>")
  end
  
  it "get '/account' shows account page if logged in" do
    post('/login', username: 'miss3')
    response = get('/account')
    expect(response.status).to eq (200)
    expect(response.body).to include ("<h1>miss3's account</h1>")
  end

  it "get '/signup' redirects to homepage if already logged in" do
    post('/login', username: 'mister1')
    response = get('/signup')
    expect(response.status).to eq (302)
  end

  it "get '/login' redirects to homepage if already logged in" do
    post('/login', username: 'mrs2')
    response = get('/login')
    expect(response.status).to eq (302)
  end

  it "get '/signup' returns signuplogin page with login logout test" do
    post('/login', username: 'Robin')
    post('/logout')
    response = get('/signup')
    expect(response.status).to eq (200)
    expect(response.body).to include ('<form action="/signup" method="POST">')
  end

  it "get '/login' returns signuplogin page with login logout test" do
    post('/login', username: 'Robin')
    post('/logout')
    response = get('/login')
    expect(response.status).to eq (200)
    expect(response.body).to include ('<form action="/login" method="POST">')
  end
  
  it "get '/deletepeep' displays peep delete page if logged in" do
    response = get('/deletepeep')
    expect(response.status).to eq (302)
    post('/login', username: 'miss3')
    response = get('/deletepeep')
    expect(response.status).to eq (200)
    expect(response.body).to include("<title>miss3's peep delete page</title>") 
  end 

  it "get '/personpeeps' displays just the peeps of one user" do
    response = get('/personpeeps', id: '3', username: 'miss3')
    expect(response.status).to eq (200)
    expect(response.body).to include ("<title>miss3's peeps page</title>")
    expect(response.body).to include ("<p> Anyone else njoyin the sunshin today? --- miss3 --- peeped at 2022-11-01 13:01:47</p>")
  end

  it "post '/' adds a peep correctly" do
    post('/login', username: 'mrs2', user_id: '2')
    response1 = get('/')
    expect(response1.status).to eq 200
    expect(response1.body).to include (" <title>mrs2's Chitter page</title>")
    response2 = post('/', content: 'another new test peep')
    test_time = Time.now.strftime('%Y-%m-%d %H:%M')
    expect(response2.status).to eq 200
    expect(response2.body).to include("<head>mrs2 has just peeped</head>")
    expect(response2.body).to include("<p>another new test peep</p>")
    expect(response2.body).to include("<p>peep added at #{test_time}")
    
  end

  it "post '/' adds a peep fails if not logged in" do
    response = post('/', content: 'another new test peep', userid: '2')
    expect(response.status).to eq 400
  end

  it "post '/' adds a peep fails if content blank" do
    post('/login', username: 'mrs2', user_id: '2')
    response1 = get('/')
    expect(response1.status).to eq 200
    response2 = post('/', content: '', userid: '2')
    expect(response2.status).to eq 400
  end

  it "adds a new user from signup form" do
    response = post('/signup', username: '4th person', email: '4th@gmail.com', password: '1234')
    expect(response.status).to eq 200
    expect(UsersRepo.new.view_user('4th person').id).to eq ('4')
    expect(response.body).to include ('<h1>Welcome, 4th person</h1>')
  end

 end
