class AddComplexityToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :complexity, :integer, default: 0, null: false
    add_index :tasks, :complexity
  end
end
