require "google_drive"

class GetAnswerService
  attr_reader :question

  def initialize question
    @question = question
  end

  def perform
    session = GoogleDrive::Session.from_service_account_key("xuka-bot-key.json")

    spreadsheet = session.spreadsheet_by_title("Xuka Data")
    worksheet = spreadsheet.worksheets.first

    worksheet.rows.reverse.each do |row|
      if question.include? row[0]
        return row[1]
      end
    end
    return nil
  end
end
