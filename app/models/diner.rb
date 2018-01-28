class Diner < ApplicationRecord
  has_many :diners_groups
  has_many :groups, through: :diners_groups

  scope :new_members, -> { where(start_year: DateTime.now.year) }
  scope :not_new, -> { where.not(start_year: DateTime.now.year) }
end
