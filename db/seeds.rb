# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating roles'

['admin','agent','customer'].each do |role|
  Role.find_or_create_by(name: role)
end

puts 'Creating status'

['open','processing','closed'].each do |status|
  Status.find_or_create_by(name: status)
end

puts 'Creating Admin user'

admin_user = User.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = 'changeme'
end
admin_user.add_role :admin

puts 'Creating Agents'

['agent1@example.com','agent2@example.com'].each do |u|
  user = User.find_or_create_by(email: u) do |user|
    user.password = 'changeme'
  end
  user.add_role :agent
end

puts 'Creating Customers'

['customer1@example.com','customer2@example.com'].each do |u|
  user = User.find_or_create_by(email: u) do |user|
    user.password = 'changeme'
  end
  user.add_role :customer

end