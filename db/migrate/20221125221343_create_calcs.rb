class CreateCalcs < ActiveRecord::Migration[7.0]
  def change
    create_table :calcs do |t|
      t.string :n
      t.string :a

      t.timestamps
    end
  end
end
