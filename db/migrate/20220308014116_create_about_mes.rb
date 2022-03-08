class CreateAboutMes < ActiveRecord::Migration[7.0]
  def change
    create_table :about_mes do |t|
      t.integer :dob
      t.string :from
      t.string :career
      t.string :current_job
      t.string :funny
      t.timestamps
    end
  end
end
