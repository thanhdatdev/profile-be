class CreateAbouts < ActiveRecord::Migration[7.0]
  def change
    create_table :abouts do |t|
      t.integer :dob
      t.string :from
      t.string :career
      t.string :current_job
      t.string :funny
      t.string :icons, array: true, default: []
      t.timestamps
    end
  end
end
