class CreateEnemies < ActiveRecord::Migration[5.2]
  def change
    create_table :enemies do |t|
      t.string :name
      t.integer :power_base
      t.integer :power_step
      t.integer :level, default: 1
      t.integer :kind

      t.timestamps
    end
  end
end
