class Restaurant < ApplicationRecord
  before_validation :downcase_category
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

  private
  def downcase_category
    self.category = category.downcase if category.present?
  end
end
