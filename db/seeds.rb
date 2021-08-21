puts "---Clear andmin and bot---"
Admin.destroy_all

puts "---Create andmin and bot---"
admin = Admin.create user_name: "iamdummy", email: "dummy@gmail.com", password: "Aa@123456"
admin.bots.create bot_name: "Dummy", room_id: 239482004, token: "3a3c3552f1f3ca26babe5e8554354afa"
