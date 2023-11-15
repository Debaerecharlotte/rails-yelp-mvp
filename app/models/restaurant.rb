class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  before_validation :downcase_fields
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian) }

  def downcase_fields
    category.downcase!
  end
end
