class Bot < ApplicationRecord
  belongs_to :admin
  has_many :questions, dependent: :destroy

  validates :room_id, uniqueness: true
  validates :token, presence: true
  validate :correct_token?

  def client
    ChatWork::Client.new(api_key: token)
  end

  def send_message message
    ChatworkMessageJob.perform_later token, room_id, message
  end

  private

  def correct_token?
    client.get_me
  rescue StandardError
    errors.add :token, :invalid
  end
end
