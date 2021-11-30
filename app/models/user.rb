class User < ApplicationRecord
  has_many :groups, dependent: :destroy, foreign_key: 'author_id'
  has_many :purchases, dependent: :destroy, foreign_key: 'author_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :name, :email
  validates :name, :email, presence: true
  validates :password, length: { 
    minimum: 8,
    too_short: "password is too short, must be at least %{count} characters"
   }
end
