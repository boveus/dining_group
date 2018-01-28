class Diner < ApplicationRecord
  has_many :diners_groups
  has_many :groups, through: :diners_groups
end
