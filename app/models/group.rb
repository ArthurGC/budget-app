class Group < ApplicationRecord
  has_and_belongs_to_many :purchases
  belongs_to :user
end
