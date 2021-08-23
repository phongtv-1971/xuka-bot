module DigistContentExtension
  extend ActiveSupport::Concern

  included do
    before_validation do |record|
      record.digist ||= Digest::MD5.hexdigest(record.content.downcase) if record.digist.blank?
    end

    validates :digist, presence: true, uniqueness: {case_sensitive: true}
    validates :content, presence: true
  end
end
