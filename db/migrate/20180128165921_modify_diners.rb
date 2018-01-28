class ModifyDiners < ActiveRecord::Migration[5.1]
  def change
    add_column :diners, :start_year, :integer
    remove_column :diners, :group
  end
end
