class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expenses, dependent: :destroy
  has_many :groups, through: :expenses, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true
  validates :author_id, presence: true
  
  accepts_nested_attributes_for :expenses
end
