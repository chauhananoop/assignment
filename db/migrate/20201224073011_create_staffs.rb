class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :username
      t.string :email
      t.text :address
      t.string :profile

      t.timestamps
    end
  end
end
