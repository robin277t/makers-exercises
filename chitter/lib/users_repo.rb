class User
    attr_accessor :id, :username, :password, :email
end


class UsersRepo

    def view_user(username)
        user = User.new
        sql = "select * from users where username = $1"
        raw_result = DatabaseConnection.exec_params(sql,[username])
        return "no user with that username" if raw_result.ntuples==0
        result = raw_result[0]
        user.id = result['id']
        user.username = result['username']
        user.password = result['password']
        user.email = result['email']
        return user
    end

    def add(username, password, email)
        if view_user(username) == "no user with that username"
            sql = 'insert into users ("username","password","email") values ($1,$2,$3)'
            DatabaseConnection.exec_params(sql,[username,password,email])
            return "#{username} added to chitter successfully"
        else
            return "user with that name already registered, please try again"
        end
    end

    def delete(username)
        if view_user(username) == "no user with that username"
            return "can't delete, user not found"
        else 
            sql = "delete from users where username = $1"
            DatabaseConnection.exec_params(sql,[username])
            return "#{username} successfully removed from chitter"
        end
    end

    def update_username(username, new_username)
        sql = "update users set username = $2 where username = $1"
        DatabaseConnection.exec_params(sql,[username,new_username])
        return "username update successful"
    end

    def update_email(username, new_email)
        sql = "update users set email = $2 where username = $1"
        DatabaseConnection.exec_params(sql,[username, new_email])
        return "email update successful"
    end

    def update_password(username, new_password)
        sql = "update users set password = $2 where username = $1"
        DatabaseConnection.exec_params(sql,[username, new_password])
        return "password update successful"
    end

    def view_all_usernames
        result = DatabaseConnection.exec_params("select username from users",[]) 
        result.values.join(':').split(':')
    end


end