class AddStudentIdToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :student_id, :integer
  end
end
