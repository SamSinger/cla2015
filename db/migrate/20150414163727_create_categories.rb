class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :list_order
      t.datetime :timestamps
    end
  end
end
