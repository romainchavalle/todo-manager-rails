class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.string :color, default: "#4f46e5", null: false
      t.integer :status, default: 0, null: false
      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :projects, :name, unique: true
    add_index :projects, :status
  end
end
