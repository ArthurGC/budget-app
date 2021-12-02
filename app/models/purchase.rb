class Purchase < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :author, class_name: 'User'

  validates :name, :amount, presence: true
  validates :amount, numericality: true
end
