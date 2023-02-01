$LOAD_PATH << "lib"
require "users_repo"
require "pg"

RSpec.describe UsersRepo do
    
    def reset_tables
        seed_sql = File.read("spec/seeds/chitter_reseed.sql")
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_tests' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_tables
    end

    let(:userrepo) {UsersRepo.new}


    it "view_user method returns user" do
        expect(userrepo.view_user('mister1').email).to eq ("mister1@gmail.com")
        expect(userrepo.view_user('mister1').username).to eq ("mister1")
    end

    it "view_user method returns error message if no match" do
        expect(userrepo.view_user('mister1555')).to eq "no user with that username"
    end

    it "adds new user and views" do
        expect(userrepo.add("jeff","1234","jeff@gmail.com")).to eq "jeff added to chitter successfully"
        expect(userrepo.view_user('jeff').username).to eq ("jeff")
    end

    it "deletes user and checks they're not in views" do
        userrepo.delete("mister1")
        expect(userrepo.view_user('mister1')).to eq ("no user with that username")
    end

    it "updates username, email and password correctly" do
        userrepo.update_username('mister1', 'MISTER1000')
        userrepo.update_email('MISTER1000', 'newemail@yahoo.net')
        userrepo.update_password('MISTER1000', '5678')
        expect(userrepo.view_user('MISTER1000').username).to eq("MISTER1000")
        expect(userrepo.view_user('MISTER1000').email).to eq("newemail@yahoo.net")
        expect(userrepo.view_user('MISTER1000').password).to eq("5678")
    end

    it "views all usernames as an array" do
        expect(userrepo.view_all_usernames).to eq(['mister1','mrs2','miss3'])
    end

    it "add checks for duplicate" do
        expect(userrepo.add("mister1","1234","mister1@gmail.com")).to eq "user with that name already registered, please try again"
    end

    it "delete doesn't work if user not found" do
        expect(userrepo.delete("mister1999")).to eq "can't delete, user not found"
    end
  
end