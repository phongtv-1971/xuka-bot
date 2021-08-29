class Question < ApplicationRecord
  include DigistContentExtension

  belongs_to :bot
  has_many :answers, dependent: :destroy
  has_many :score_boards

  enum question_type: {single_choice: 0, multi_choice: 1, train: 3}

  strip_attributes only: :content

  class << self
    def search content, bot_id
      digist = Digest::MD5.hexdigest(content.downcase)
      find_by digist: digist, bot_id: bot_id
    end
  end
end
