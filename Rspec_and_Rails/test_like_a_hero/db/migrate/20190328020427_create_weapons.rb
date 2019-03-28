class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :description
      t.integer :power_base
      t.integer :power_step
      t.integer :level, default: 1

      t.timestamps
    end
  end
end
