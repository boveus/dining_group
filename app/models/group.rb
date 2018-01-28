class Group < ApplicationRecord
  has_many :diners_groups
  has_many :diners, through: :diners_groups
end
