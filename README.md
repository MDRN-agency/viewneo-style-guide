# Local setup instruction
1. Config environment variables
  - Create `.env` by copy from `.env.example`, then fill appropriate values. Notes:
  - `SECRET_KEY_BASE`: random
  - `BASE_URL`: same with your local domain that rails server running on. Default is `http://localhost:3000`
2. Init app and database
```
./bin/setup
```
The above command will do:
- Create `config/database.yml` if not exist
- Run `bundle install`
- Run `rake db:setup` (create, migrate and seed)

# Deployment instruction
Updating ...
