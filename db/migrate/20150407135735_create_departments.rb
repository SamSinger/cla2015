class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :list_order
      t.datetime :timestamps
    end
  end
end
