class Url < ApplicationRecord
  before_create :set_token
  validates_presence_of :address
  validates_format_of :address, :with => URI::regexp(%w(http https))

  private

  def set_token
    self.token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.alphanumeric(5)
      break token unless Url.find_by(token: token).present?
    end
  end
end
