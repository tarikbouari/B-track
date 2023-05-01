class Entity < ApplicationRecord
   belongs_to :author, class_name: 'User'
   has_many :expenses,  dependent: :destroy
   has_many :groups, through: :expenses, dependent: :destroy
end
