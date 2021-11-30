class Group < ApplicationRecord
  has_and_belongs_to_many :purchases, dependent: :destroy
  belongs_to :author, class_name: 'User'

  validates_uniqueness_of :name
  validates :name, :icon, presence: true

  def total_amount
    total = 0
    purchases.each do |purchase|
      total += purchase.amount
    end
    total
  end
end
