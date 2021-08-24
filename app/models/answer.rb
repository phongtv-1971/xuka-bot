class Answer < ApplicationRecord
  belongs_to :question

  strip_attributes only: :content
end
