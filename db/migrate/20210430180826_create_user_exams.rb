class CreateUserExams < ActiveRecord::Migration[6.1]
  def change
    create_table :user_exams do |t|
      t.datetime :start_time
      t.references :user, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
