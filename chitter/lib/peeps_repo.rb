class Peeps
    attr_accessor :id, :user_id, :time, :content, :username
end


class PeepsRepo
    
    def show_all_peeps
        sql = "select peeps.id, peeps.user_id, time, content, username from peeps inner join users on users.id = peeps.user_id order by time desc"
        result = DatabaseConnection.exec_params(sql,[])
        peeplist = []
        result.each do |peep|
            peeptemp = Peeps.new
            peeptemp.id = peep['id'] 
            peeptemp.user_id = peep['user_id'] 
            peeptemp.time = peep['time'] 
            peeptemp.content = peep['content'] 
            peeptemp.username = peep['username']
            peeplist << peeptemp
        end
        return peeplist
    end

    def show_your_peeps(user_id)
        sql = "select * from peeps where user_id = $1 order by time desc"
        result = DatabaseConnection.exec_params(sql,[user_id])
        if result.ntuples == 0
            return "no peeps to show yet"
        else
            peeplist = []
            result.each do |peep|
                peeptemp = Peeps.new
                peeptemp.id = peep['id'] 
                peeptemp.user_id = peep['user_id'] 
                peeptemp.time = peep['time'] 
                peeptemp.content = peep['content'] 
                peeplist << peeptemp
            end
            return peeplist
        end
    end

    def add_peep(user_id, content)
        sql = 'insert into peeps ("user_id", "time","content") values ($1,now()::timestamp(0),$2)' 
        DatabaseConnection.exec_params(sql,[user_id,content])
        sql2 = 'select time from peeps where content = $1' 
        time = DatabaseConnection.exec_params(sql2,[content])[0]['time']
        return "peep added at #{time}"
    end
    
    def show_one_peep(peep_id)
        sql = 'select * from peeps where id = $1' 
        result = DatabaseConnection.exec_params(sql,[peep_id])
        if result.ntuples==0
            return "no peep found"
        else    
            peeptemp = Peeps.new
            peeptemp.id = result[0]['id'] 
            peeptemp.user_id = result[0]['user_id'] 
            peeptemp.time = result[0]['time'] 
            peeptemp.content = result[0]['content'] 
            return peeptemp
        end
    end

    def delete_peep(peep_id)
        if show_one_peep(peep_id) == "no peep found"
            return "can't find this peep to delete"
        else
            DatabaseConnection.exec_params('delete from peeps where id = $1',[peep_id])
            return "peep deleted"
        end
    end

end