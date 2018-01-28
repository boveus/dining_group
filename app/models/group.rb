class Group < ApplicationRecord
  has_many :diners_groups
  has_many :diners, through: :diners_groups

  def self.add_members_to_groups
    new_members = Diner.new_members.to_a.shuffle
    not_new_members = Diner.not_new.to_a.shuffle
    groups = Group.all
    counter = 0
    while !(new_members.empty?) || !(not_new_members.empty?)
      counter += 1
      if !(new_members.empty?)
        groups[counter % groups.count].diners << new_members.shift << not_new_members.shift
      elsif !(not_new_members.empty?)
        groups[counter % groups.count].diners << not_new_members.shift
      end
    end
  end

  def self.create_groups
    group_count = (Diner.count / 10) + 1
    alphabet_letters = ('A'..'Z').to_a

    group_count.times do
      Group.create(letter: alphabet_letters.shift)
    end
  end
end
