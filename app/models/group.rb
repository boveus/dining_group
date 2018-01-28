class Group < ApplicationRecord
  has_many :diners_groups
  has_many :diners, through: :diners_groups

  def self.generate
    new_members = Diner.new_members
    not_new_members = Diner.not_new
  end

  def self.create_groups
    group_count = (Diner.count / 10) + 1
    alphabet_letters = ('A'..'Z').to_a

    group_count.times do
      Group.create(letter: alphabet_letters.shift)
    end
  end
end
