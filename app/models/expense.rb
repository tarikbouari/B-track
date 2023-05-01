class Expense < ApplicationRecord
    belongs_to :entity, class_name: 'Entity'
    belongs_to :group, class_name: 'Group'
end
