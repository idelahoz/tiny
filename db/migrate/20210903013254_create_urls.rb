class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :address
      t.string :token
      t.integer :visits, default: 0

      t.index :token
      t.timestamps
    end
  end
end
