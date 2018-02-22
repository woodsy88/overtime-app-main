class Hand < ApplicationRecord

# self referential model association
  belongs_to :user
  belongs_to :hand, class_name: 'User'
end
