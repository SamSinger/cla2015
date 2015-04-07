class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :office_address
      t.string :phone
      t.string :rank
      t.text :interest_areas
      t.string :instructional_areas
      t.string :monday_hours
      t.string :tuesday_hours
      t.string :wednesday_hours
      t.string :thursday_hours
      t.string :friday_hours
      t.integer :department_id
      t.datetime :timestamps
    end
  end
end
