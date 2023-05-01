class Group < ApplicationRecord

    #validatiopns
    validates :name, presence: true
    validates :icon, presence: true

    belongs_to :user, class_name: 'User'
    has_many :expenses, dependent: :destroy
    has_many :entities, through: :expenses, dependent: :destroy
end
