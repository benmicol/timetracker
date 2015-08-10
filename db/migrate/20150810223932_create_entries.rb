class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :date
      t.string :time
      t.boolean :archived

      t.timestamps null: false
    end
  end
end
