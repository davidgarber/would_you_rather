class AddScoreColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_a_score, :integer, default: 0
    add_column :questions, :answer_b_score, :integer, default: 0
  end
end
