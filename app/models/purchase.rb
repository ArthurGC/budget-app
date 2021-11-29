class Purchase < ApplicationRecord
  has_and_belongs_to_many :groups, dependent: :destroy
  belongs_to :author, class_name: 'User'
end
