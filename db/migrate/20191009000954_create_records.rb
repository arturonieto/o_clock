class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.datetime :check_in #null: false
      t.datetime :check_out
      t.integer  :employee_id
      t.timestamps
    end
  end
end
