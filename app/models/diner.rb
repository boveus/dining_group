class Diner < ApplicationRecord
  has_one :diners_group
  has_one :group, through: :diners_group

  scope :new_members, -> { where(start_year: DateTime.now.year) }
  scope :not_new, -> { where.not(start_year: DateTime.now.year) }

  def group_addresses
    group.diners.pluck(:address)
  end

  def get_distance_from_group
    GoogleMapsService.new.get_distance(self.address, self.group_addresses)
  end
end
