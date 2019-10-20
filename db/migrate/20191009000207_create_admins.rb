class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string   :first_name
      t.string   :last_name
      t.integer  :user_id
      t.timestamps
    end
  end
end
