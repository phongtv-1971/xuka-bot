class Admin < ApplicationRecord
  has_many :bots, dependent: :destroy
end
