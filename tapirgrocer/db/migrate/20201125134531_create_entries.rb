class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :fullname
      t.integer :nric
      t.integer :body_temp

      t.timestamps
    end
  end
end
