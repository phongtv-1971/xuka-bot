class Question < ApplicationRecord
  belongs_to :bot
  has_many :answers, dependent: :destroy
  has_many :score_boards

  enum type: {single_choice: 0, multi_choice: 1, train: 3}
end
