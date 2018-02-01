class Group < ApplicationRecord
  has_many :diners_groups
  has_many :diners, through: :diners_groups

  DinerList = Struct.new(:new_ones, :not_new)

  def self.add_members_to_groups
    counter = 0
    members = DinerList.new(Diner.new_members.to_a.shuffle, Diner.not_new.to_a.shuffle)
    while !(members.new_ones.empty?) || !(members.not_new.empty?)
      add_members(counter, members)
      counter += 1
    end
  end

  def self.add_members(counter, members)
    if !(members.new_ones.empty?)
      Group.all[counter % Group.count].diners << members.new_ones.shift << members.not_new.shift
    elsif !(members.not_new.empty?)
      Group.all[counter % Group.count].diners << members.not_new.shift
    end
  end

  def self.number_of_groups
     (Diner.count / 10) + 1
  end

  def self.create_groups
    alphabet_letters = ('A'..'Z').to_a
    number_of_groups.times { Group.create(letter: alphabet_letters.shift) }
  end
end
