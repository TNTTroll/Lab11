class AddResultToCalc < ActiveRecord::Migration[7.0]
  def change
    add_column :calcs, :result, :text
  end
end
