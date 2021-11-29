class Group < ApplicationRecord
  has_and_belongs_to_many :purchases, dependent: :destroy
  belongs_to :author, class_name: 'User'
end
