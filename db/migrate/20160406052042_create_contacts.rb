class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
     t.string :name
     t.string :email
     t.string :phone_no
     t.string :post_address
     t.string :message
      t.timestamps null: false
    end
  end
end
