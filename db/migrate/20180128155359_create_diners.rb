class CreateDiners < ActiveRecord::Migration[5.1]
  def change
    create_table :diners do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :group

      t.timestamps
    end
  end
end
