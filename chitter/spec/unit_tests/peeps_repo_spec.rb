$LOAD_PATH << "lib"
require "peeps_repo"
require "pg"

RSpec.describe PeepsRepo do
    
    def reset_tables
        seed_sql = File.read("spec/seeds/chitter_reseed.sql")
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_tests' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_tables
    end

    let(:peeprepo) {PeepsRepo.new}

    it "shows all peeps in reverse chronological order" do
        expect(peeprepo.show_all_peeps[0].content).to eq ('please someone buy my stuff') 
        expect(peeprepo.show_all_peeps[2].id).to eq ('4')
        expect(peeprepo.show_all_peeps[0].username).to eq ('miss3') 
    end

    it "shows your peeps only" do
        expect(peeprepo.show_your_peeps(3)[1].id).to eq ('9')
    end
    
    it "shows blank if you haven't peeped yet" do
        expect(peeprepo.show_your_peeps(4)).to eq ('no peeps to show yet')
    end

    it "adds peep with correct data including time" do
        peeprepo.add_peep('1','new test peep here!')
        expect(peeprepo.show_your_peeps('1')[0].content).to eq "new test peep here!"
        test_time = Time.now.strftime('%Y-%m-%d %H:%M')
        expect(peeprepo.show_your_peeps('1')[0].time).to include (test_time)
        expect(peeprepo.add_peep('1','new test peep here!')).to include "peep added at #{test_time}"
    end

    it "shows one peep by id" do
        expect(peeprepo.show_one_peep('4').content).to include "giving"
    end

    it "shows one peep by id not found" do
        expect(peeprepo.show_one_peep('12')).to eq "no peep found"
    end

    it "deletes peep" do
        expect(peeprepo.show_one_peep('4').content).to include "giving"
        expect(peeprepo.delete_peep('4')).to eq "peep deleted"
        expect(peeprepo.show_one_peep('4')).to eq "no peep found"
    end

    it "deletes peep fails for not finding" do
        expect(peeprepo.delete_peep('12')).to eq "can't find this peep to delete"
    end

end

