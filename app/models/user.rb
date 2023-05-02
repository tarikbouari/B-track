class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validation
  validates :name, presence: true, length: { in: 1..250 }

  has_many :entities, dependent: :destroy
  has_many :groups, dependent: :destroy
end
