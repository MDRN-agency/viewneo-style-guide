User.create!(
  first_name: 'John',
  last_name: 'Doe',
  email: 'admin@example.com',
  password: 'changeme',
  is_admin: true
)
puts "Created admin user: email: 'admin@example.com' password: 'changeme'"
