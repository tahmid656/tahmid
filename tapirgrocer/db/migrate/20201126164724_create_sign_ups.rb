class CreateSignUps < ActiveRecord::Migration[5.1]
  def change
    create_table :sign_ups do |t|
      t.string :fullname
      t.string :store_location

      t.timestamps
    end
  end
end
