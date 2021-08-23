namespace :fake_data do
  task create: :environment do
    puts "---Clear andmin and bot---"
    Admin.destroy_all

    puts "---Create andmin and bot---"
    admin = Admin.create user_name: "iamdummy", email: "dummy@gmail.com", password: "Aa@123456"
    bot = admin.bots.create bot_name: "Dummy", room_id: 239482004, token: "3a3c3552f1f3ca26babe5e8554354afa"

    puts "---Start get data form google sheet---"
    session = GoogleDrive::Session.from_service_account_key("xuka-bot-key.json")
    spreadsheet = session.spreadsheet_by_title("Xuka Data")
    worksheet = spreadsheet.worksheets.first

    worksheet.rows.reverse.each do |row|
      question = bot.questions.create content: row[0], question_type: :train
      question.answers.create content: row[1], is_correct: nil
      puts "---Create question id: #{question.id} success---"
    end

    puts "---End get data form google sheet---"
  end
end
