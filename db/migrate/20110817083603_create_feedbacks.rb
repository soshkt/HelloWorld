class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :from
      t.string :content

      t.timestamps
    end
  end
end
