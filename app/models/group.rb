class Group < ApplicationRecord
  # validatiopns
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user, class_name: 'User'
  has_many :expenses, dependent: :destroy
  has_many :entities, through: :expenses, dependent: :destroy

  def total_amount
    total = 0
    entities.each do |entity|
      total += entity.amount
    end
    total
  end
end
