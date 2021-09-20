class Bot < ApplicationRecord
  belongs_to :admin
  has_many :questions, dependent: :destroy

  validates :room_id, uniqueness: true
  validates_numericality_of :room_id, only_integer: true
  validates :token, presence: true
  validate :correct_token?

  def client
    ChatWork::Client.new(api_key: token)
  end

  def send_message message, undefined_question = nil
    ChatworkMessageJob.perform_later token, room_id, message, undefined_question
  end

  def avatar_url
    client.get_me.avatar_image_url
  end

  private

  def correct_token?
    client.get_me
  rescue StandardError
    errors.add :token, :invalid
  end
end
