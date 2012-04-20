class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :question1
      t.text :question2
      t.integer :user_id

      t.timestamps
    end
  end
end
