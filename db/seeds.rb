
admin_role = Role.find_or_create_by!(name: "Admin")
user_role  = Role.find_or_create_by!(name: "User")

puts "Roles ensured"

admin_user = User.find_or_initialize_by(email: "admin@example.com")
admin_user.assign_attributes(
  password: "password123",
  password_confirmation: "password123",
  mobile_no: "9832263805",
  first_name: "Admin",
  last_name: "User",
  is_active: true,
  is_delete: false,
  is_admin: true,
  confirmed_at: Time.current # skips email confirmation
)
admin_user.save!

admin_user.roles << admin_role unless admin_user.roles.include?(admin_role)

puts "Admin user created"

normal_user = User.find_or_initialize_by(email: "user@example.com")
normal_user.assign_attributes(
  password: "password123",
  password_confirmation: "password123",
  mobile_no: "8888888888",
  first_name: "Normal",
  last_name: "User",
  is_active: true,
  is_delete: false,
  is_admin: false,
  confirmed_at: Time.current
)
normal_user.save!

# Assign User role
normal_user.roles << user_role unless normal_user.roles.include?(user_role)

puts "Normal user created"
