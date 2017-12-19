class CreateMyRsas < ActiveRecord::Migration[5.1]
  def change
    create_table :my_rsas do |t|
      t.integer :n
      t.integer :d
      t.integer :e

      t.timestamps
    end
  end
end
