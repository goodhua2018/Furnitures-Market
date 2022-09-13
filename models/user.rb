def create_user (user_name, email, password)
    password_digest = BCrypt::Password.create(password)
    run_sql("INSERT INTO users(user_name, email, password_digest) VALUES($1, $2, $3)", [user_name, email, password_digest])
end

def find_user_by_email(email)
    users = run_sql("SELECT * FROM users WHERE email = $1", [email])
    # if more than one user, pick the first one, but if no one is found, return nil
    if users.to_a.count > 0 
        users[0]
    else 
        nil
    end
end

def find_user_by_id(id)
    users = run_sql("SELECT * FROM users WHERE id = $1", [id])[0]
end
